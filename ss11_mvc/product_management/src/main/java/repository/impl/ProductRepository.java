package repository.impl;

import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL = "SELECT * FROM gaming_lap;";
    private static final String INSERT = "INSERT INTO gaming_lap VALUE (?,?, ?, ?, ?);";

    @Override
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                float price = resultSet.getFloat("price");
                String description = resultSet.getString("description");
                String brand = resultSet.getString("brand");
                productList.add(new Product(id,name,price,description,brand));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }


    @Override
    public void saveProduct(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setInt(1,product.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public void deleteProduct(int id) {
//        for (int i = 0; i <productList.size() ; i++) {
//            if(id==productList.get(i).getId()){
//                productList.remove(i);
//            }
//        }
    }

    @Override
    public void editProduct(Product product) {
//        int id = product.getId();
//        for (int i = 0; i < productList.size(); i++) {
//            if (id == productList.get(i).getId()){
//                productList.set(i,product);
//                break;
//            }
//        }

    }
}
