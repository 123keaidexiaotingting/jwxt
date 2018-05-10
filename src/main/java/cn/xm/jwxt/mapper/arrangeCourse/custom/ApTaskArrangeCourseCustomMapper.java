package cn.xm.jwxt.mapper.arrangeCourse.custom;

import cn.xm.jwxt.bean.arrangeCourse.ApTaskArrangeCourse;
import cn.xm.jwxt.bean.arrangeCourse.custom.ApTaskArrangeCourseCustom;
import org.springframework.test.context.jdbc.Sql;

import java.sql.SQLException;
import java.util.List;

/**
 * 项目名称：jwxt
 * 类描述：排课任务分配课程表的自定义mapper
 * 创建人：LL
 * 创建时间：2018/5/6 18:09
 */
public interface ApTaskArrangeCourseCustomMapper {
    /**
     * 批量插入排课任务分配课程信息
     * @param coursesInfo
     * @return
     * @throws SQLException
     */
    int saveTaskArrangeCourseInfoList(List<ApTaskArrangeCourse> coursesInfo) throws SQLException;

    /**
     * 根据排课任务ID查询对应的教师课程信息
     * @param arrangeTaskId
     * @return
     * @throws SQLException
     */
    List<ApTaskArrangeCourseCustom> findTaskArrangeCourseAndTeacherListByArrangeId(String arrangeTaskId) throws SQLException;

    /**
     * 根据安排课程ID查询查询每一门课程对应的教师课程信息
     * @param arrangeCourseId
     * @return
     * @throws SQLException
     */
    ApTaskArrangeCourseCustom getTaskArrangeCourseAndTeacherClassInfo(String arrangeCourseId) throws SQLException;
}