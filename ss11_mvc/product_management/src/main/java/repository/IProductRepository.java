package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();
    void saveProduct(Product product);

    void deleteProduct(int id);

    void editProduct(Product product);
}
