package cn.xm.jwxt.service.impl.workLoad;

import cn.xm.jwxt.mapper.workLoad.CourseWorkLoadMapper;
import cn.xm.jwxt.service.workLoad.CourseWorkLoadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.*;

@Service
@SuppressWarnings("all")
public class CourseWorkLoadServiceImpl implements CourseWorkLoadService {

    @Autowired
    private CourseWorkLoadMapper courseMapper;
    /**
     * 查询教师课程工作量
     * @param condition
     * @return
     */
    @Override
    public List<Map<String, Object>> findCourseWorkLoad(Map<String, Object> condition)  throws SQLException{
        List<Map<String,Object>> courseList = courseMapper.findCourseWorkLoad(condition);
        for(int i=0;i<courseList.size();i++){
            String teacher_course_id = (String) courseList.get(i).get("teacher_course_id");
            List<Map<String,Object>> classInfoList = courseMapper.findClassInfoByteacher_course_id(teacher_course_id);
                String classNames = " ";
                int stuNum = 0;
                for(int j=0;j<classInfoList.size();j++){
                    classNames = classNames +"/"+ classInfoList.get(j).get("class_name");
                    stuNum = stuNum + (int)classInfoList.get(j).get("class_size");
                }
            courseList.get(i).put("classNames",classNames);
            courseList.get(i).put("stuNum",stuNum+"");
        }
        Collections.sort(courseList, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> o1, Map<String, Object> o2) {
                String bxn1 = ((String)o1.get("academic_year")).substring(0,4);
                int intBxn1 = Integer.parseInt(bxn1);
                String bxn2 = ((String)o2.get("academic_year")).substring(0,4);
                int intBxn2 = Integer.parseInt(bxn2);
                int i = intBxn2 - intBxn1;
                if(i==0){
                    String xq1 = (String) o1.get("term");
                    int intXq1 = Integer.parseInt(xq1);
                    String xq2 = (String) o1.get("term");
                    int intXq2 = Integer.parseInt(xq2);
                    i = intXq1 - intXq2;
                }
                return i;
            }
        });
        return courseList;
    }

    /**
     * 查询详细信息
     *
     * @param teacher_course_id
     * @return
     */
    @Override
    public Map<String, Object> findOneCourseDetail(String teacher_course_id)  throws SQLException{
        // 详细信息（基本）
        Map<String,Object> mapInfo = new HashMap<String,Object>();
            mapInfo = courseMapper.findCourseDetail(teacher_course_id);
        // 查询班级信息列表
        List<Map<String,Object>> list = courseMapper.findClassInfoByteacher_course_id(teacher_course_id);
            mapInfo.put("list",list);
//        // 用于存储学生列表
//        Map<String,Object> stuMap = new HashMap<String,Object>();
//        for(int i=0;i<list.size();i++){
//            String className = (String) list.get(i).get("class_name");
//
//        }
        return mapInfo;
    }

    /**
     * 根据班级查学生列表
     *
     * @return
     */
    @Override
    public List<String> findStuListByClassName(String className)  throws SQLException {
        List<String> list = courseMapper.findStuListByClassName(className);
        return list;
    }
}
