package repository.impl;

import model.Level;
import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static final String SELECT_ALL_STUDENT = "SELECT * FROM student INNER  JOIN level ON student.level_id = level.id;";
    private static final String SELECT_ALL_LEVEL = "SELECT * FROM level;";
    private static final String INSERT_STUDENT = "INSERT INTO student (name, age, country, level_id) VALUE (?,?,?,?);";
    @Override
    public List<Student> getList() {
        Connection connection = BaseRepository.getConnection();
        List<Student> studentList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age  = resultSet.getInt("age");
                String country = resultSet.getString("country");
                int levelId = resultSet.getInt("level_id");
                String levelName = resultSet.getString("level.name");
                Level level = new Level(levelId,levelName);
                Student student = new Student(id,name,age,country,level);
                studentList.add(student);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return studentList;
    }

    @Override
    public List<Level> getLevelList() {
        List<Level> levelList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LEVEL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                levelList.add(new Level(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return levelList;
    }

    @Override
    public boolean saveStudent(Student student) {
        Connection connection = BaseRepository.getConnection();
        boolean check;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setInt(2,student.getAge());
            preparedStatement.setString(3,student.getCountry());
            preparedStatement.setInt(4,student.getLevel().getId());
            check = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return check;
    }
}
