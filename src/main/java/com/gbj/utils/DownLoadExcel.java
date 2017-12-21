package com.gbj.utils;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

import com.gbj.model.Goods;

import java.io.*;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created  by 0 on 2017/9/
 */
public class DownLoadExcel {


    /**
     * 公共缴费信息表
     * @param adeathClaimList
     * @param fileName
     * @param currentUser
     * @param userFilesPath
     * @return
     */
    public static String goodsExcel(List<Goods> goodsList, String fileName) {
        // 目标文件
        FileOutputStream outputStream;
        // 文件绝对路径
        String filePath  = null;
        //创建workbook
        XSSFWorkbook wb = new XSSFWorkbook();
        //创建hseet
        XSSFSheet sheet = wb.createSheet("商品详细");
        for (int i=0;i<6;i++){
            sheet.setColumnWidth(i, 20 * 256);
        }
        //获取行数
        int totalRows = goodsList.size();
        //获取列数
        int totalCells = 6;
        XSSFCellStyle style = wb.createCellStyle();
        //设置边框样式
        style.setBorderTop(XSSFCellStyle.BORDER_THIN);
        style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        style.setBorderRight(XSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);  //居中
        //创建行
        for (int i = 0; i < (totalRows + 2); i++) {
            XSSFRow row = sheet.createRow(i);    //第几行
            //添加表头
            if (i == 0) {
                XSSFCellStyle cellStyle = wb.createCellStyle();
                for (int k = 0; k < 6; k++) {
                    XSSFCell cell = row.createCell(k);     //创建第k个单元格
                    row.createCell(k).setCellValue("");
                    cell.setCellStyle(style);           //设置样式
                }
                //新建font实体
                XSSFFont hssfFont = wb.createFont();
                hssfFont.setFontHeightInPoints((short) 16);  //字体大小
                hssfFont.setFontName("楷体");
                cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);  //居中
                cellStyle.setFont(hssfFont);
                XSSFCell cell = row.createCell(0);
                cell.setCellValue("商品详细");
                //合并单元格
                sheet.addMergedRegion(new CellRangeAddress(0, (short) 0, 0, 6));
                cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
                cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
                cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
                cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
                cell.setCellStyle(cellStyle);                 //设置样式
                continue;
            }
            //第二行
            if (i == 1) {
                for (int k = 0; k < 6; k++) {
                    XSSFCell cell = row.createCell(k);
                    switch (k) {
                        case 0:row.createCell(0).setCellValue("商品名称"); break;
                        case 1:row.createCell(1).setCellValue("商品类型");break;
                        case 2: row.createCell(2).setCellValue("价格");break;
                        case 3:row.createCell(3).setCellValue("会员价");break;
                        case 4:row.createCell(4).setCellValue("供应商");break;
                        case 5:row.createCell(5).setCellValue("单位");break;
                        //case 6:row.createCell(6).setCellValue("资产汇集机构名称");break;
                    }
                    cell.setCellStyle(style);           //设置样式
                }
            }
            //第三行添加数据
            if (1 < i && i < (totalRows + 2)) {
                //从集合中依次添加数据
                Goods goods = goodsList.get(i - 2);
                for (int k = 0; k < 6; k++) {
                    XSSFCell cell = row.createCell(k);
                    switch (k) {
                        case 0:cell.setCellValue(goods.getGoods_name());break;
                        case 1:cell.setCellValue(goods.getGtype().getGt_type());break;
                        case 2:cell.setCellValue(goods.getGoods_price());break;
                        case 3:cell.setCellValue(goods.getGoods_vipprice());break;
                        case 4:cell.setCellValue(goods.getSupplier().getSup_name());break;
                        case 5:cell.setCellValue(goods.getGu().getGu_name());break;
                        //case 6:cell.setCellValue(goods.getZiChanHuiJiJiGouMingCheng());break;
                    }
                    cell.setCellStyle(style);           //设置样式
                }
            }
        }
        //生成模板,存储到本地磁盘
        try {
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
            String s = simpleDateFormat.format(date);
            //定义文件绝对地址
            String filePathDir = FileUtil.getRootLocation();

            File tempFile = new File(filePathDir);
            if(!tempFile.exists()){
                tempFile.mkdirs();
            }
            filePath = filePathDir + fileName + ".xlsx";
            outputStream = new FileOutputStream(filePath);
            wb.write(outputStream);
            outputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return filePath;
    }



}