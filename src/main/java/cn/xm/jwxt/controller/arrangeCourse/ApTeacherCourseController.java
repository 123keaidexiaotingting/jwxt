package cn.xm.jwxt.controller.arrangeCourse;

import cn.xm.jwxt.bean.arrangeCourse.custom.ApTaskArrangeCourseCustom;
import cn.xm.jwxt.bean.baseInfo.TTeacherBaseInfo;
import cn.xm.jwxt.queryVo.ListVo;
import cn.xm.jwxt.service.arrangeCourse.ApTeacherCourseService;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 项目名称：jwxt
 * 类描述：排课的教师课程信息的Controller
 * 创建人：LL
 * 创建时间：2018/5/9 21:16
 */
@Controller
@RequestMapping("/arrangeCourse")
public class ApTeacherCourseController {
    private Logger logger = Logger.getLogger(ApTeacherCourseController.class);
    @Resource
    private ApTeacherCourseService teacherCourseService;

    /**
     * 根据学院ID查询教师信息（在职的）
     * @param academicId
     * @return
     */
    @RequestMapping("/findTeacherBaseInfo")
    public @ResponseBody
    List<TTeacherBaseInfo> findTeacherBaseInfo(String academicId){
        List<TTeacherBaseInfo> teachersBaseInfo = null;
        try {
            teachersBaseInfo = teacherCourseService.findTeacherBaseInfoByAcademicId(academicId);
        } catch (Exception e) {
            logger.error("查询在职教师信息失败!",e);
        }
        return teachersBaseInfo;
    }

    /**
     * 根据课程编号查询历史任课教师
     * @param courseNumber
     * @return
     */
    @RequestMapping("/findHistoryTeacherInfo")
    public @ResponseBody List<Map<String,Object>> findHistoryTeacherInfo(String courseNumber){
        List<Map<String, Object>> historyTeacherInfo = null;
        try {
            historyTeacherInfo = teacherCourseService.findHistoryTeacherInfoByNumber(courseNumber);
        } catch (Exception e) {
            logger.error("查询历史任课教师信息失败!",e);
        }
        return historyTeacherInfo;
    }

    /**
     * 根据任务安排课程ID批量插入教师课程班级信息
     * @param listInfo
     * @param arrangeCourseId
     * @return
     */
    @RequestMapping("/saveTeacherCourseCustomInfoList")
    public @ResponseBody String saveTeacherCourseCustomInfoList(ListVo listInfo,String arrangeCourseId){
        try {
            teacherCourseService.saveTeacherCourseInfoList(arrangeCourseId,listInfo.getTeacherCourseCustoms());
        } catch (Exception e) {
            logger.error("保存教师课程信息出错！",e);
            return "添加失败";
        }
        return "添加成功";
    }

    /**
     * 批量设置课程教师班级信息用于根据历史记录排课
     * @param listInfo
     * @return
     */
    @RequestMapping("/saveTeacherCourseInfoListFromHistory")
    public @ResponseBody String saveTeacherCourseInfoListFromHistory(ListVo listInfo){
        try {
            teacherCourseService.saveTeacherCourseInfoList(listInfo.getTaskArrangeCourseCustoms());
        } catch (Exception e) {
            logger.error("保存教师课程信息出错！",e);
            return "添加失败";
        }
        return "添加成功";
    }
}
