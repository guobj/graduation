package com.gbj.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

/**
 * 文件工具类.
 * 提供常用的文件操作，包括文件复制、移动、删除、下载等操作，以及文件缓存和对这些文件的存取
 * 放入的临时文件建议在合适的时间清除掉
 * @title FileUtil
 * @author Gavin
 * @version 1.0 Gavin 文件或文件夹的复制、删除、移动、缓存，文件与流、字节的转换，下载文件
 * @version 1.1 Gavin 清空目录中的svn文件
 * @version 1.2 Gavin 如果目录下已经存在某文件名，则可以获取新的文件名；获取文件名（不包含后缀）和后缀
 */
public final class FileUtil {
	//存放临时文件
	private static ConcurrentHashMap<String, File> fileCache;
	/**
	 * 私有构造器。
	 */
	private FileUtil(){}
	/**
	 * 从缓存中获取文件
	 * @param key
	 * @return
	 */
	public static File getFileInCache(String key){
		if(fileCache!=null&&fileCache.containsKey(key)){
			return fileCache.get(key);
		}else{
			return null;
		}
	}
	
	/**
	 * 将文件放入缓存，并返回文件对应的key
	 * @param file
	 * @return true放入成功，false已存在
	 */
	public static boolean addFileInCache(String key,File file){
		if(fileCache==null){
			fileCache=new ConcurrentHashMap<String, File>();
		}
		if(fileCache.contains(key)){
			return false;
		}else{
			fileCache.put(key, file);
			return true;
		}
	}
	
	/**
	 * 获得项目根目录，用于在Web项目中使用。
	 * 直接执行会有问题。
	 * @return
	 * @throws Exception
	 */
	public static String getRootLocation(){
		File root=new File(FileUtil.class.getClassLoader().getResource("").getPath());
		String basepath=root.getParentFile().getParentFile().getAbsolutePath()+File.separator;
		return basepath;
	}

	/**
	 * 删除文件或文件夹（包括子文件）
	 * @param filepath
	 */
	public static void deleteFile(String filepath) {
		if(filepath!=null){
			deleteFile(new File(filepath));
		}
	}

	/**
	 * 删除文件或文件夹（包括子文件）
	 * @param file
	 */
	public static void deleteFile(File file) {
		if(file!=null&&file.exists()){
			if (file.isDirectory()) {
				File[] children = file.listFiles();
				if (children != null && children.length != 0) {
					for (File child:children) {
						deleteFile(child);
					}
				}
			}
			file.delete();
		}
	}
	/**
	 * 从缓存中删除文件
	 * @param key
	 * @return
	 */
	public static boolean deleteFileInCache(String key){
		if(fileCache!=null&&fileCache.contains(key)){
			fileCache.remove(key);
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 将一个文件转换成字节数组
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static byte[] getByte(File file) throws IOException   {
        byte[] bytes = new byte[(int)file.length()];
        FileInputStream fis=new FileInputStream(file);
        fis.read(bytes);
        fis.close();
        return bytes;
	}
	
	/**
	 * 将一个文件转换成字节数组
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static FileInputStream getInputStream(File file) throws IOException   {
		return new FileInputStream(file);
	}
	
	/**
	 * 将一个文件转换成字节数组
	 * @param
	 * @return
	 * @throws IOException
	 */
	public static byte[] getByte(InputStream in) throws IOException{
		byte[] bs=new byte[in.available()];
		in.read(bs);
		return bs;
	}
	/**
	 * 将字节码转换为文件
	 * @param
	 * @return
	 * @throws IOException
	 */
	public static File getFile(InputStream in,String filename) throws IOException{
		if(in!=null&&filename!=null){
			File file=new File(filename);
			if(!file.exists()){
				file.createNewFile();
			}
			FileOutputStream fos=new FileOutputStream(file);
			byte[] temp=new byte[1024];
			int length=0;
			while((length=in.read(temp))>0){
				fos.write(temp,0,length);
			}
			fos.flush();
			fos.close();
			return file;
		}else{
			return null;
		}
	}
	
	/**
	 * 将字节码转换为文件
	 * @param bytes
	 * @return
	 * @throws IOException
	 */
	public static File getFile(byte[] bytes,String filename) throws IOException{
		if(bytes!=null&&filename!=null&&bytes.length>0){
			File file=new File(filename);
			if(!file.exists()){
				file.createNewFile();
			}
			FileOutputStream fos=new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
			return file;
		}else{
			return null;
		}
	}
	
	/**
	 * 获取网络文件
	 * @param sourceURL 网络文件路径
	 * @param destination 目标文件
	 * @throws IOException
	 */
	public static void getFile(String sourceURL,File destination) throws IOException{
		URL u = new URL(sourceURL);
		FileUtils.copyURLToFile(u, destination);
	}
	
	/**
	 * 下载文件
	 * @param filename
	 * @param
	 * @param response
	 * @throws IOException
	 */
	public static void downloadFile(String filename,File file, HttpServletResponse response) throws IOException {
		downloadFile(filename,new FileInputStream(file),response);
	}
	/**
	 * 下载文件
	 * @param filename
	 * @param
	 * @param response
	 * @throws IOException
	 */
	public static void downloadFile(String filename,InputStream is, HttpServletResponse response) throws IOException {
		if(is!=null){
			filename = new String(filename.getBytes("gbk"), "ISO8859-1");
			response.reset();
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("content-type", "application/octet-stream");
			response.setHeader( "Content-Disposition", "attachment;filename=" + filename );
			response.setDateHeader("Expires", -1);
			response.setContentType("application/octet-stream");
			OutputStream out = response.getOutputStream();
			byte[] buff = new byte[1024*8];
			BufferedInputStream bis = new BufferedInputStream(is);
			int i = bis.read(buff);
			while (i != -1) {
				out.write(buff, 0, buff.length);
				out.flush();
				i = bis.read(buff);
			}
			out.close();
			bis.close();
			is.close();
		}
	}
	
	/**
	 * 下载文件（支持断点续传）
	 * 如果下载文件供播放（视频或音频等），必须使用该方法。
	 * @param request
	 * @param response
	 * @param file
	 * @param fileName
	 * @throws IOException
	 */
	public static void downloadFilebBreakpoint(HttpServletRequest request,HttpServletResponse response,File file,String fileName) throws IOException {
		 BufferedInputStream bis = null;
         if (file.exists()) {
             long p = 0L;
             long toLength = 0L;
             long contentLength = 0L;
             //0,从头开始的全文下载；1,从某字节开始的下载（bytes=27000-）；2,从某字节开始到某字节结束的下载（bytes=27000-39000）
             int rangeSwitch = 0; 
             long fileLength;
             String rangBytes = "";
             fileLength = file.length();
   
             // get file content
             InputStream ins = new FileInputStream(file);
             bis = new BufferedInputStream(ins);
   
             // tell the client to allow accept-ranges
             response.reset();
             response.setHeader("Accept-Ranges", "bytes");
   
             // client requests a file block download start byte
             String range = request.getHeader("Range");
             if (range != null && range.trim().length() > 0 && !"null".equals(range)) {
                 response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                 rangBytes = range.replaceAll("bytes=", "");
                 // bytes=270000-
                 if (rangBytes.endsWith("-")) {  
                     rangeSwitch = 1;
                     p = Long.parseLong(rangBytes.substring(0, rangBytes.indexOf("-")));
                     // 客户端请求的是270000之后的字节（包括bytes下标索引为270000的字节）
                     contentLength = fileLength - p;  
                 } else { // bytes=270000-320000
                     rangeSwitch = 2;
                     String temp1 = rangBytes.substring(0, rangBytes.indexOf("-"));
                     String temp2 = rangBytes.substring(rangBytes.indexOf("-") + 1, rangBytes.length());
                     p = Long.parseLong(temp1);
                     toLength = Long.parseLong(temp2);
                     // 客户端请求的是 270000-320000 之间的字节
                     contentLength = toLength - p + 1; 
                 }
             } else {
                 contentLength = fileLength;
             }
   
             // 如果设设置了Content-Length，则客户端会自动进行多线程下载。如果不希望支持多线程，则不要设置这个参数。
             // Content-Length: [文件的总大小] - [客户端请求的下载的文件块的开始字节]
             response.setHeader("Content-Length", new Long(contentLength).toString());
   
             // 断点开始
             // 响应的格式是:
             // Content-Range: bytes [文件块的开始字节]-[文件的总大小 - 1]/[文件的总大小]
             if (rangeSwitch == 1) {
                 String contentRange = new StringBuffer("bytes ").append(new Long(p).toString()).append("-")
                         .append(new Long(fileLength - 1).toString()).append("/")
                         .append(new Long(fileLength).toString()).toString();
                 response.setHeader("Content-Range", contentRange);
                 bis.skip(p);
             } else if (rangeSwitch == 2) {
                 String contentRange = range.replace("=", " ") + "/" + new Long(fileLength).toString();
                 response.setHeader("Content-Range", contentRange);
                 bis.skip(p);
             } else {
                 String contentRange = new StringBuffer("bytes ").append("0-")
                         .append(fileLength - 1).append("/")
                         .append(fileLength).toString();
                 response.setHeader("Content-Range", contentRange);
             }
             
             response.setContentType("application/octet-stream");
             fileName = new String(fileName.getBytes("gbk"), "ISO8859-1");
             response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
   
             OutputStream out = response.getOutputStream();
             int n = 0;
             long readLength = 0;
             int bsize = 1024;
             byte[] bytes = new byte[bsize];
             if (rangeSwitch == 2) {
                 // 针对 bytes=27000-39000 的请求，从27000开始写数据                    
                 while (readLength <= contentLength - bsize) {
                     n = bis.read(bytes);
                     readLength += n;
                     out.write(bytes, 0, n);
                 }
                 if (readLength <= contentLength) {
                     n = bis.read(bytes, 0, (int) (contentLength - readLength));
                     out.write(bytes, 0, n);
                 }                   
             } else {
                 while ((n = bis.read(bytes)) != -1) {
                     out.write(bytes,0,n);                                                      
                 }                   
             }
             out.flush();
             out.close();
             bis.close();
         } else {
        	 throw new FileNotFoundException("文件不存在："+fileName);
         }
	}
	
	/**
	 * 下载文件
	 * @param filename
	 * @param
	 * @param response
	 * @throws IOException
	 */
	public static void downloadFile(String filename,byte[] data, HttpServletResponse response) throws IOException {
		downloadFile(filename,new ByteArrayInputStream(data),response);
	}
	
	/**
	 * 解决有的浏览器下载文件时文件名乱码问题
	 * @param request
	 * @param filename
	 * @return
	 */
	public static String toUtf8String(HttpServletRequest request,String filename){
        String agent=request.getHeader("user-agent");       
        String str = "default";
        try {
            if (agent.indexOf("MSIE") != -1) {
                str = URLEncoder.encode(filename,"UTF-8");
                if(str.length()>150){
                    str=new String(filename.getBytes("GBK"),"ISO-8859-1");
                }
            }else{
            	str = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
            }
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return str;
    }
	
	/**
	 * 两个文件是否有交叉.
	 * 1.如果两个文件如果两个都是文件并且两个文件都存在即为交叉
	 * 2.如果一个为文件一个为文件夹，即为交叉
	 * 3.如果都为文件夹，如果该文件夹内有相对文件重复，即为交叉，如果includeRoot为false，那忽略根目录
	 * @param srcFile
	 * @param toCoverFile
	 * @param includeRoot
	 * @return
	 */
	public static boolean cross(File srcFile,File toCoverFile,boolean includeRoot){
		return false;
	}
	
	/**
	 * 复制文件
	 * @param srcFile 源文件路径
	 * @param destFile 目标文件路径
	 * @param overlay 是否覆盖，如果目标文件已存在，并且该参数为false，那么返回false
	 * @return 是否复制成功，源文件不存在、复制失败、文件已存在并且没选择覆盖则返回false。
	 */
	public static boolean copyFile(String srcFile,String destFile,boolean overlay){
		if(srcFile==null&&destFile==null){
			return false;
		}else{
			return copyFile(new File(srcFile), new File(destFile),overlay);
		}
	}
	
	/**
	 * 复制文件
	 * @param srcFile 源文件
	 * @param destFile 目标文件
	 * @param overlay 是否覆盖，如果目标文件已存在，并且该参数为false，那么返回false
	 * @return 是否复制成功，源文件不存在、复制失败、文件已存在并且没选择覆盖则返回false。
	 */
	public static boolean copyFile(File srcFile, File destFile,boolean overlay) {  
		return copyOrRemoveFile(srcFile,destFile,overlay,true);
	}
	
	//复制或移动文件
	private static boolean copyOrRemoveFile(File srcFile, File destFile,boolean overlay,boolean isCopy) {  
        // 判断源文件是否存在  
        if (srcFile==null||!srcFile.exists()) {  
            return false;  
        }  
        // 如果目标文件所在目录不存在，则创建目录  
        if (!destFile.exists()&&!destFile.getParentFile().exists()) {  
            // 目标文件所在目录不存在  
            if (!destFile.getParentFile().mkdirs()) {  
                // 复制文件失败：创建目标文件所在目录失败  
                return false;
            }
        }
  
        if(srcFile.isDirectory()){
        	boolean complated=true;
        	if(destFile.exists()){
        		if(!destFile.isDirectory()){
        			if(overlay){
            			deleteFile(destFile);
            		}else{
            			return false;
            		}
        		}
        	}else{
        		complated=destFile.mkdir();
        	}
        	if(complated){
        		File[] children=srcFile.listFiles();
        		boolean allComplate=true;
        		for(File child:children){
        			allComplate=copyOrRemoveFile(child,new File(destFile.getAbsoluteFile()+"\\"+child.getName()),overlay,isCopy);
        			if(!allComplate){
        				break;
        			}
        		}
        		return allComplate;
        	}else{
        		return false;
        	}
        }else{
        	boolean complated=true;
        	if(destFile.exists()){
        		if(overlay){
        			deleteFile(destFile);
        		}else{
        			complated=false;
        		}
        	}
        	if(complated){
        		if(isCopy){
        			InputStream in = null;  
        			OutputStream out = null;  
        			try {  
        				in = new FileInputStream(srcFile);  
        				out = new FileOutputStream(destFile);  
        				byte[] buffer = new byte[1024];  
        				int byteread = 0; // 读取的字节数  
        				while ((byteread = in.read(buffer)) != -1) {  
        					out.write(buffer, 0, byteread);  
        				}  
        				return true;  
        			} catch (FileNotFoundException e) {  
        				return false;  
        			} catch (IOException e) {  
        				return false;  
        			} finally {  
        				try {  
        					if (out != null)  
        						out.close();  
        					if (in != null)  
        						in.close();  
        				} catch (IOException e) {  
        					e.printStackTrace();  
        				}  
        			}
        		}else{
        			return srcFile.renameTo(destFile);
        		}
        	}else{
        		return false;
        	}
        }
    }
	
	/**
	 * 移动文件
	 * @param srcFile 源文件
	 * @param destFile 目标文件
	 * @param overlay 是否覆盖，如果目标文件已存在，并且该参数为false，那么返回false
	 * @return 是否复制成功，源文件不存在、移动失败、文件已存在并且没选择覆盖则返回false。
	 */
	public static boolean removeFile(File srcFile, File destFile,boolean overlay) { 
		return copyOrRemoveFile(srcFile,destFile,overlay,false);
	} 
	
	/**
	 * 移动文件
	 * @param srcFile 源文件
	 * @param destFile 目标文件
	 * @param overlay 是否覆盖，如果目标文件已存在，并且该参数为false，那么返回false
	 * @return 是否复制成功，源文件不存在、移动失败、文件已存在并且没选择覆盖则返回false。
	 */
	public static boolean removeFile(String srcFile,String destFile,boolean overlay){
		if(srcFile==null&&destFile==null){
			return false;
		}else{
			return removeFile(new File(srcFile), new File(destFile),overlay);
		}
	}
	
	/**
	 * 删除指定文件夹中的svn文件夹，svn同步后的项目中会被生成一些svn标识文件，
	 * 当复制该项目到其它地方时会包含这些svn文件，为了正常工作复制后要清空这些svn。
	 * @param file 文件夹
	 */
	public static void deleteSvnFile(File file){
		if(file.isDirectory()){
			if(file.getName().equals(".svn")){
				FileUtil.deleteFile(file);
			}else{
				File[] files=file.listFiles();
				for(File f:files){
					deleteSvnFile(f);
				}
			}
		}
	}
	
	/**
	 * 获取不包含后缀的文件名
	 * @param fileName
	 * @exception
	 * @return
	 */
	public static String getFileNameWithoutSuffix(String fileName){
		if(fileName.indexOf(".")>-1){
			return fileName.substring(0, fileName.lastIndexOf("."));
		}else{
			return fileName;
		}
	}
	
	/**
	 * 获取文件名后缀
	 * @param fileName
	 * @exception
	 * @return 如果没有文件后缀则返回null
	 */
	public static String getFileSuffix(String fileName){
		if(fileName.indexOf(".")>-1){
			return fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
		}else{
			return null;
		}
	}
	
	/**
	 * 获取新文件名
     * 当该文件名不存在时直接返回原文件名，如果存在则获取重复名的文件名
	 * @param basepath 文件目标目录
	 * @param oldfilename 原文件名
	 * @return
	 */
    public static String getNewFileName(String basepath,String oldfilename){
    	//先判断文件名本身是否存在，不存在直接返回本身，因为大部分情况下可能不会重复的。
    	File oldFile=new File(basepath+File.separator+oldfilename);
    	if(!oldFile.exists()){
    		return oldfilename;
    	}
    	//当文件名本身存在，再开始重命名
    	String filename=getFileNameWithoutSuffix(oldfilename);
    	String suffix=getFileSuffix(oldfilename);
    	int flag=0;
    	String newFileName=null;
    	while((newFileName=getNewFileName(basepath,filename,suffix,flag++))==null){
    		continue;
    	}
    	return newFileName;
    }
    private static String getNewFileName(String basepath,String filename,String suffix,int flag){
    	String newFileName;
    	if(flag<=0){
    		newFileName=filename+"."+suffix;
    	}else{
    		newFileName=filename+"("+flag+")"+"."+suffix;
    	}
    	File newFile=new File(basepath+File.separator+newFileName);
    	if(newFile.exists()){
    		return null;
    	}else{
    		return newFileName;
    	}
    }
    
    /**
     * 格式化文件大小
     * @param bytes
     * @return
     */
    public static String formatFileSize(long bytes) {
    	DecimalFormat df  = new DecimalFormat("###.00");
    	int i = (int) Math.floor(Math.log(bytes) / Math.log(1024));
    	String[] sizes = new String[]{"B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"};
    	return df.format(bytes / Math.pow(1024, i)) + " " + sizes[i];
    }
    
	public static void main(String[] args) {
		/*File file=new File("D:\\development\\workspace\\sjqfx\\111");
		deleteSvnFile(file);*/
		
		//System.out.println(getRootLocation());
		long bytes = 21369;
		System.out.println(formatFileSize(bytes));
	}
	
	
}
