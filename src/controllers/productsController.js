const fs = require('fs');
const path = require('path');

const productsFilePath = path.join(__dirname, '../database/product.json');
const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));

const usersController = {
   
    list: function(req, res){
        res.render('products/productList', {products});
    },

    detail: function(req, res){
        const producto = products.find(p => p.id == req.params.id)
        const productosCategory = products.filter(p => p.category == producto.category)
        res.render('products/productDetail', {productosCategory, producto});
    },

    edit: function(req, res){
        const producto = products.find(p => p.id == req.params.id)
        res.render('products/productEdit', {producto});
    },
    
    //Alta de un Producto
    create: function(req, res){
        res.render('products/productCreate');
    },

    //Almacenar un producto
    store: function(req, res){
        if(req.file){
            let producto = {
              id: products[products.length -1].id + 1,
              ...req.body,
              image: req.file.filename
            }
            products.push(producto);
            let productsJson = JSON.stringify(products);
            fs.writeFileSync(productsFilePath, productsJson);
            return res.redirect('/');
          }
        },

    //Modificar un producto
    storeEdited: function(req, res){
/*         if(req.file){
            let producto = {
              ...req.body,
              image: req.file.filename
            }
            products.push(producto);
            let productsJson = JSON.stringify(products);
            fs.writeFileSync(productsFilePath, productsJson);
            return res.redirect('/');
          }
        }, */
        const producto = products.find(p => p.id == req.params.id)
        producto.name = req.body.name;
        producto.price = req.body.price;
        producto.description = req.body.description;
        producto.category = req.body.category;
        if(req.file){
          producto.image = req.file.filename;
        }
        producto.offer = req.body.offer;
        producto.order = req.body.order;
        fs.writeFileSync(productsFilePath, JSON.stringify(products, null, ' '));
        res.redirect('/products');
    },

        //Borrar un producto
    delete: (req, res) => {
        const producto = products.find(p => p.id == req.params.id);
        fs.unlinkSync(path.join(__dirname, `../../public/images/${producto.image}`));
        products.splice(products.indexOf(producto), 1);
        fs.writeFileSync(productsFilePath, JSON.stringify(products, null, ''));
        res.redirect('/products');
    }

 };
 
 module.exports = usersController;