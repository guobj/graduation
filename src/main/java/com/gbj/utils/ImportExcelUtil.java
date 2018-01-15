package com.gbj.utils;/**
 * Created by HaoJianYu on 2017/12/19.
 */

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.gbj.model.Goods;

/**
 * @author Administrator
 * @create 2017-12-19 21:55
 * @desc ImportpublicAccountUtil
 * DATE
 **/
public class ImportExcelUtil {
    // @描述：是否是2003的excel，返回true是2003
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    //@描述：是否是2007的excel，返回true是2007
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }

    public static List<String> getErrorList() {
        return errorList;
    }

    public static void setErrorList(List<String> errorList) {
    	ImportExcelUtil.errorList = errorList;
    }

    public static List<String> errorList;//错误信息集合
    //总行数
    private int totalRows = 0;
    //总条数
    private int totalCells = 0;
    //错误信息接收器
    private String errorMsg;

    //构造方法
    public ImportExcelUtil() {
    }

    //获取总行数
    public int getTotalRows() {
        return totalRows;
    }

    //获取总列数
    public int getTotalCells() {
        return totalCells;
    }

    //获取错误信息
    public String getErrorInfo() {
        return errorMsg;
    }


    /**
     * 读EXCEL文件，获取信息集合
     *
     * @param mFile
     * @return
     */
    public List<Goods> getExcelInfo(MultipartFile mFile) throws IOException {
        String fileName = mFile.getOriginalFilename();//获取文件名
        if (!validateExcel(fileName)) {// 验证文件名是否合格
            return null;
        }
        boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
        if (isExcel2007(fileName)) {
            isExcel2003 = false;
        }
        //获取文件输入流
        List<Goods> dtoList = createExcel(mFile.getInputStream(), isExcel2003);
        return dtoList;
    }


    /**
     * 验证EXCEL文件
     *
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }


    /**
     * 根据excel里面的内容读取客户信息
     *
     * @param is          输入流
     * @param isExcel2003 excel是2003还是2007版本
     * @return
     * @throws IOException
     */
    public List<Goods> createExcel(InputStream is, boolean isExcel2003) {
        Workbook wb = null;
        if (isExcel2003) { // 当excel是2003时,创建excel2003
            try {
                wb = new HSSFWorkbook(is);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else { // 当excel是2007时,创建excel2007
            try {
                wb = new XSSFWorkbook(is);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        List<Goods> dtoList = readExcelValue(wb);// 读取Excel里面客户的信息
        return dtoList;
    }


    /**
     * 读取Excel里面的工资项数据集合
     *
     * @param wb
     * @return
     */
    private List<Goods> readExcelValue(Workbook wb) {
        int numberOfSheets = wb.getNumberOfSheets();
        List<Goods> dtoList = new ArrayList<>();
        BigDecimal b = new BigDecimal(0);
        //获取Excel的每个sheet
        // 得到Excel的行数
        for (int i = 0; i <numberOfSheets; i++) {
            Sheet sheet = wb.getSheetAt(i);
            this.totalRows = sheet.getPhysicalNumberOfRows();

            // 得到Excel的列数(前提是有行数)
            if (totalRows > 1 && sheet.getRow(2) != null) {
                this.totalCells = sheet.getRow(2).getPhysicalNumberOfCells();
            }

            // 循环Excel行数,从第3行开始
            for (int r = 2; r < totalRows; r++) {
            	Goods dto = new Goods();
                //获取每一行
                Row row = sheet.getRow(r);
                if (row == null) {
                    continue;
                }
                here:
                // 循环Excel的列
                for (int c = 0; c < this.totalCells; c++) {
                    //获取每一行的每一列
                    Cell cell = row.getCell(c);
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    switch (c){
                        case 0:
                                String goods_name = cell.getStringCellValue();
                                dto.setGoods_name(goods_name);
                                break;
                        case 1:
                            Integer goods_type =Integer.parseInt(cell.getStringCellValue());
                            dto.setFk_gt_id(goods_type);
                            break;
                        case 2:
                            Double price =Double.parseDouble(cell.getStringCellValue()) ;
                            dto.setGoods_price(price);
                            break;
                        case 3:
                        	Double goods_vipprice =Double.parseDouble(cell.getStringCellValue()) ;
                            dto.setGoods_vipprice(goods_vipprice);
                            break;
                        case 4:
                        	 Integer supplier =Integer.parseInt(cell.getStringCellValue());
                                if(supplier != null){
                                    dto.setFk_sup_id(supplier);
                                }
                                break;
                        case 5:
                        	Integer unit =Integer.parseInt(cell.getStringCellValue());
                                dto.setFk_gu_id(unit);
                                break;
                        /*case 6:
                                String ziChanHuiJiJiGouMingCheng = cell.getStringCellValue();
                                dto.setZiChanHuiJiJiGouMingCheng(ziChanHuiJiJiGouMingCheng);
                                break;
                        case 7:
                            dto.setZuZhiJiGouWaiJian(zuZhiJiGouWaiJian);
                            break;
                        case 8:
                            dto.setJiaoFeiQiJian(jiaoFeiQiJian);
                            break;*/
                    }

                }
                dtoList.add(dto);
            }
        }
        return dtoList;
    }
}
