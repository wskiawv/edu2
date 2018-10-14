package com.szlhsoft.core.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VideoConverterUtil {
	protected static Log log = LogFactory.getLog(VideoConverterUtil.class);
	private  static Process process;
	//private static String ffmpegPath="ffmpeg";//ffmpeg所在路径,配置环境变量后直接使用
	//通用设置
	private static String f="";//强迫采用格式
	private static String i="";//输入方法
	private static String y="";//覆盖输出文件
	private static String t="";//设置记录时间
	private static String title="";//设置标题
	private static String author="";//设置作者
	private static String copyright="";//设置版权
	private static String comment="";//设置评论
	private static String target_type="";//设置目标文件类型(vcd,svcd,dvd)
	private static String hq="";//激活高质量设置
	private static String itsoffset="";//设置以秒为基准的时间偏移
	//视频选项
	private static String resolution="";//分辨率
	private static String bit="";//视频比特率
	private static String r="";//帧频
	private static String s="";//帧大小
	private static String aspect="";//设置横纵比
	private static String croptopSize="";//设置顶部切除带大小像素单位
	private static String cropbottomSize="";//
	private static String padtopSize="";//设置顶部补齐大小 像素单位
	private static String vn="";//不做视频记录
	private static String bt="";//设置视频码率容忍度 
	private static String maxrate="";//设置最大视频码率容忍度
	private static String minreate="";//设置最小视频码率容忍度
	private static String bufsize="";//设置码率控制缓冲区大小
	private static String vcodec="";//强制使用codec编解码方式
	private static String sameq="";//使用同样视频质量作为源
	private static String pass="";//选择处理遍数
	private static String passlogfile="";//选择两遍的纪录文件名为
	//高级视频选项
	private static String ggopSize="";//设置图像组大小
	private static String intra="";//仅适用帧内编码
	private static String qscale="";//使用固定的视频量化标度
	private static String qmin="";//最小视频量化标度
	private static String qmax="";//最大视频量化标度
	private static String qdiff="";//量化标度间最大偏差
	private static String dblur="";//视频量化标度柔化
	private static String qcomp="";//视频量化标度压缩
	private static String rc_init="";//一遍编码的初始化复杂度
	private static String b_qfactor="";//在p和b帧间的qp因子
	private static String i_qfactor="";//在p和i帧间的qp因子
	private static String b_qoffset="";//在p和b帧间的qp偏差
	private static String i_qoffset="";//在p和i帧间的qp偏差
	private static String rc_eq="";//设置码率控制方程
	private static String rc_override="";//特定间隔下的速率控制重载
	private static String me_method="";//设置运动估计的方法
	private static String dct_algo="";//设置dct的算法
	private static String idct_algo="";//设置idct算法
	private static String er_n="";//设置错误残留为n
	private static String er_bit="";//设置错误掩蔽为bit_mask
	private static String mv4="";//使用4个运动矢量仅用于Mp4
	private static String part="";//使用数据划分，仅用于mpeg4
	private static String bug_param="";//绕过没有被自动监测到编码器的问题
	private static String strict="";//跟标准的严格性
	private static String aic="";//使能高级帧内编码 h263
	private static String umy="";//使能无限运动矢量 h263
	private static String deinterlace="";//不采用交织方法
	private static String interlace="";//强迫交织法编码
	private static String psnr="";//计算压缩帧的psnr
	private static String vstats="";//输出视频编码统计到vstats_hhmmss.log
	private static String yhook_module="";//插入视频处理模块

	//音频选项
	private static String ab="";//设置音频码率
	private static String ar="";//设置音频采样率
	private static String ac_channels="";//设置通道缺省为1
	private static String an="";//不使用音频记录
	private static String acodec="";//使用codec编解码
	//音频、视频捕获选项
	private static String vd_device="";//设置视频
	private static String vc_channel="";//设置视频捕获通道
	private static String tvstd="";//设置电视标准
	private static String dv1394="";//设置DV1394捕获
	private static String av_device="";//设置音频设备 仅在linux下有效
	//高级选项
	private static String map_file="";//设置输入流映射
	private static String dubug="";//打印特定高度信息
	private static String benchmark="";//为基准测试加入时间
	private static String hex="";//倾倒每一个输入包
	private static String bitexact="";//仅使用精确算法用于编解码测试
	private static String psSize="";//设置包大小，以bit为单位
	private static String re="";//以本地帧频读数据,主要用于模拟捕获设备
	private static String loop="";//循环输入流。只工作于图像流，用于ffserver测试
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<String,Object> params=new HashMap();
		File input=new File("E:/workspace/desktop/src/main/webapp/upload/toystory.flv");		
		File output=new File("E:\\workspace\\desktop\\src\\main\\webapp\\upload\\toystory.mp4");
		File fps25 = new File("C:\\ffmpeg\\video\\maxTutorial.mp4");
		
		
		VideoConverterUtil.converter(input, output, params);
		
//		log.info("-------视频详细信息-------"+VideoConverterUtil.getVideoInfo(input));
		//C:/ffmpeg/bin/ffmpeg, -i, L:\mnt\review\9\movieResource\34\37_001.mp4, -y, -f, image2, -ss, 1.0, -t, 0.001, -s, 234*192, /mnt/review\9\movie_info\37\preview.jpg
		//VideoConverterUtil.videoScreenshot(30.0,30.0, "1080*720", "/mnt/review/9/movie_info/37/preview.jpg", input);
		
	}
	
	public static String getFfmpegPath(){
		String os=System.getProperty("os.name").toLowerCase();
		if(os.contains("linux")){
			return "ffmpeg";
		}else if(os.contains("windows")){
			return "d:/ffmpeg/bin/ffmpeg";
		}
		return "ffmpeg";
	}
	
	/**
	 * 获取
	 * @param videoFile
	 * @throws IOException
	 */
	public static Map<String,Object> getVideoInfo(File videoFile) {
		Map<String, Object> videoInfoMap = new HashMap<String, Object>();
		//ffmpegPath="C:/ffmpeg/bin/ffmpeg";
		List<String> commend = new java.util.ArrayList<String>();  
        commend.add(getFfmpegPath());
        commend.add("-y");
        commend.add("-i");
        commend.add(videoFile.getAbsolutePath());
        try {
            ProcessBuilder builder = new ProcessBuilder();
            log.info(commend);
            builder.command(commend);
            builder.redirectErrorStream(true);
            log.info("获取视频信息...");
            // builder.start();
            Process process = builder.start();
            InputStream stderr = process.getInputStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line;
            //打印 sb，获取更多信息。 如 bitrate、width、heigt
            StringBuffer sb = new StringBuffer();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            System.out.println("video info:\n" + sb);
            //获取视频时长
            //Duration: 00:01:43.90, start: 0.000000, bitrate: 1528 kb/s
            Pattern pattern = Pattern.compile("Duration: (.*?),");
            Matcher matcher = pattern.matcher(sb);
            if (matcher.find()){
                String duration = matcher.group(1);
                //时间格式转换保留到毫秒
                String[] parts = duration.split(":");
                Double hours = Double.parseDouble(parts[0]);
                Double minutes = Double.parseDouble(parts[1]);
                Double seconds = Double.parseDouble(parts[2]);
                videoInfoMap.put("duration", (hours*3600+minutes*60+seconds)*1000);
                log.info("----时间-----"+duration);
            }
            //获取帧率
            //Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p, 1080x720 [SAR 1:1 DAR 3:2], 1416 kb/s, 30 fps, 30 tbr, 30k tbn, 60 tbc (default)
            //Stream #0:1: Video: rv40 (RV40 / 0x30345652), yuv420p, 848x480, 625 kb/s, 23.98 fps, 23.98 tbr, 1k tbn,
            pattern = Pattern.compile("Stream (.*?) Video: (.*?), (.\\d+(\\.\\d+)?) fps,");
            matcher = pattern.matcher(sb);
            if (matcher.find()){
                String frameRate = matcher.group(3);
                videoInfoMap.put("frameRate", Double.parseDouble(frameRate));
                log.info("----frameRate----"+frameRate);
            }
            //获取分辨率
            pattern = Pattern.compile("Stream (.*?) Video: (.*?), (.\\d+x\\d+)");
            matcher = pattern.matcher(sb);
            if (matcher.find()){
                String resolution = matcher.group(3);
                videoInfoMap.put("resolution", resolution.replace("x", "*"));
                log.info("----视频分辨率----"+resolution);
            }
            
            stderr.close();
            log.info("视频信息获取成功...");
        } catch (Exception e) {
            e.printStackTrace();
            log.info("视频信息获取失败！");
        }
        return videoInfoMap;
	}
	
	/**
	 * 根据视频帧数获取此帧的截图
	 * @param frames 要截图的帧
	 * @param frameRate 视频的帧率
	 * @param revolution	视频的分辨率
	 * @param prtScnPath	视频
	 * @param videoFile		视频文件
	 * @return
	 * @throws IOException
	 */
	public static String videoScreenshot(Double frames, Double frameRate, String resolution, File prtScnFile,File videoFile) {
		//ffmpegPath="C:/ffmpeg/bin/ffmpeg";
		if(!prtScnFile.getParentFile().exists()){
			prtScnFile.getParentFile().mkdirs();
		}
		List<String> commend = new java.util.ArrayList<String>();  
        commend.add(getFfmpegPath());  
        commend.add("-i");  
        commend.add(videoFile.getAbsolutePath());
        commend.add("-y");  
        commend.add("-f");  
        commend.add("image2");  
        commend.add("-ss");  
        commend.add((frames/frameRate)+"");  
        commend.add("-t");
        commend.add("0.001");
        commend.add("-s");
        //缩小分辨率至原有的 1/3
        String[] xy = resolution.split("\\*");
        if (xy.length==2){
            String x = xy[0];
            String y = xy[1];
            log.info("----视频分辨率----"+x+"*"+y);
            commend.add(Integer.parseInt(x)/3+"*"+Integer.parseInt(y)/3);
        }
        commend.add(prtScnFile.getAbsolutePath());
        
        try {
            ProcessBuilder builder = new ProcessBuilder();
            log.info(commend);
            builder.command(commend);
            builder.redirectErrorStream(true);
            log.info("视频截图开始...");
            // builder.start();
            Process process = builder.start();
            log.info("正在进行截图，请稍候");
            InputStream stderr = process.getInputStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line;
            //打印 sb，获取更多信息。 如 bitrate、width、heigt
            //StringBuffer sb = new StringBuffer();
            while ((line = br.readLine()) != null) {
            	log.info(line);
                //sb.append(line);
            }
            stderr.close();
            log.info("视频截图完成...");
        } catch (Exception e) {
            e.printStackTrace();
            log.info("视频截图失败！");
        }  
        return "";
	}
	
	public static void converter(File input,File output,Map<String,Object> params){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//
		if(params!=null){
			if(params.containsKey("bit") && params.get("bit")!=null){
				bit=String.valueOf(params.get("bit"));
			}else{
				bit="300k";
			}
			if(params.containsKey("s") && params.get("s")!=null){
				s=String.valueOf(params.get("s"));
			}else{
				s="1080x720";
			}
			if(params.containsKey("vcodec") && params.get("vcodec") != null){
				vcodec=String.valueOf(params.get("vcode"));
			}else{
				vcodec="libxvid";
			}
			if(params.containsKey("ab") && params.get("ab")!=null){
				ab=String.valueOf(params.get("ab"));
			}else{
				ab="32k";
			}
			if(params.containsKey("ar") && params.get("ar")!=null){
				ar=String.valueOf(params.get("ar"));
			}else{
				ar="24000";
			}
			if(params.containsKey("acodec") && params.get("acodec")!=null){
				acodec=String.valueOf(params.get("acodec"));
			}else{
				acodec="aac";
			}
		}
		
		List<String> commend = new java.util.ArrayList<String>();  
        commend.add(getFfmpegPath());
        commend.add("-i");
        commend.add(input.getAbsolutePath());
        commend.add(output.getAbsolutePath());
		try{
			ProcessBuilder builder = new ProcessBuilder();
            log.info(commend);
            builder.command(commend);
            builder.redirectErrorStream(true);
            // builder.start();
            Process process = builder.start();
            InputStream stderr = process.getInputStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line;
            //打印 sb，获取更多信息。 如 bitrate、width、heigt
            //StringBuffer sb = new StringBuffer();
            while ((line = br.readLine()) != null) {
            	log.info(line);
                //sb.append(line);
            }
			
			System.out.println(dateFormat.format(new Date()));
			stderr.close();
		}catch(IOException e){
			log.info(e.getMessage());
		}
	}
}
