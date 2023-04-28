package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
private static IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        List<Product> productList = iProductRepository.getAll();
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        iProductRepository.saveProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepository.deleteProduct(id);
    }

    @Override
    public void editProduct(Product product) {
        iProductRepository.editProduct(product);
    }
}
