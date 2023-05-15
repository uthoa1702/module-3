package service.impl;

import model.Level;
import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private static IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> getList() {
        return studentRepository.getList();
    }

    @Override
    public List<Level> getLevelList() {
        return studentRepository.getLevelList();
    }

    @Override
    public boolean saveStudent(Student student) {
        return studentRepository.saveStudent(student);
    }
}
