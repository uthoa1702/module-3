package repository;

import model.Level;
import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> getList();

    List<Level> getLevelList();

    boolean saveStudent(Student student);
}
