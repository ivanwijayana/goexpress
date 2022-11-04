const express = require('express');
const app = express();
var mysql = require('mysql');
var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer();

var pool = mysql.createPool({
    connectionLimit : 5,
    host: "localhost",
    user: "root",
    password: "",
    database: "app_ekspedisi"
  });   

// for parsing application/json
app.use(bodyParser.json()); 

// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true })); 
//form-urlencoded

// for parsing multipart/form-data
app.use(upload.array()); 
app.use(express.static('public'));


app.listen(3000, ()=>{
    console.log('Server running on port 3000');
});

app.use(express.urlencoded({extended:false}));

app.use(express.static('public'));



// INDEX-UTAMA
app.get('/index-utama.ejs',( req, res)=> {
    res.render('index-utama.ejs')
});



// USER
app.get('/user-checking.ejs',( req, res)=> {
    res.render('user-checking.ejs')
});

app.get('/user-lapor.ejs',( req, res)=> {
    res.render('user-lapor.ejs')
});


//SUPER ADMIN
app.get('/login.ejs',( req, res)=> {
    res.render('login.ejs')
});

app.get('/register.ejs',( req, res)=> {
    res.render('register.ejs')
});

app.get('/sa-dashboard.ejs',( req, res)=> {
    res.render('sa-dashboard.ejs')
});

app.get('/sa-form-cabang.ejs',( req, res)=> {
    res.render('sa-form-cabang.ejs')
});


app.get('/sa-form-karyawan.ejs',( req, res)=> {
    res.render('sa-form-karyawan.ejs')
});

app.get('/sa-tambah-karyawan.ejs',( req, res)=> {
    res.render('sa-tambah-karyawan.ejs')
});

app.get('/sa-tambah-cabang.ejs',( req, res)=> {
    res.render('sa-tambah-cabang.ejs')
});

app.get('/sa-manajemen-akun.ejs',( req, res)=> {
    res.render('sa-manajemen-akun.ejs')
});

app.get('/sa-m-akun-user.ejs',( req, res)=> {
    pool.query('select * from table_user', (error, results)=>{
        if (error){
            throw error;
        }
        res.render('sa-m-akun-user.ejs', {items:result.rows})
    });
});

app.get('/sa-form-user.ejs',( req, res)=> {
    res.render('sa-form-user.ejs')
});


app.get('/sa-m-akun-admin.ejs',( req, res)=> {
    res.render('sa-m-akun-admin.ejs')
});

app.get('/sa-form-admin.ejs',( req, res)=> {
    res.render('sa-form-admin.ejs')
});



// ADMIN CABANG
app.get('/index.ejs',( req, res)=> {
    res.render('admin.ejs')
});

app.get('/admin.ejs',( req, res)=> {
    res.render('admin.ejs')
});

app.get('/admin-kirim-transit.ejs',( req, res)=> {
    res.render('admin-kirim-transit.ejs')
});

app.get('/admin-kirim-penerima.ejs',( req, res)=> {
    res.render('admin-kirim-penerima.ejs')
});

app.get('/admin-terima-user.ejs',( req, res)=> {
    res.render('admin-terima-user.ejs')
});

app.post('/kirim-transit', (req, res)=>{
    const itemName1 = req.body.id_barang_input;
    const itemName2 = req.body.id_cabang_asal_input;
    const itemName3 = req.body.nama_cabang_asal_input;
    const itemName4 = req.body.id_admin_input;
    const itemName5 = req.body.nama_admin_input;
    const itemName6 = req.body.id_cabang_tujuan_input;
    const itemName7 = req.body.nama_cabang_tujuan_input;
    const itemName8 = req.body.waktu_pengiriman_input;
    const itemName9 = req.body.resi_input;
    const itemName10 = req.body.id_ekspedisi_input;
    var post = {id_barang:itemName1,
                id_cabang_asal:itemName2,
                nama_cabang_asal:itemName3,
                id_admin:itemName4,
                nama_admin:itemName5,
                id_cabang_penerima:itemName6,
                nama_cabang_penerima:itemName7,
                waktu_penerimaan:itemName8,
                resi_barang:itemName9,
                id_ekspedisi:itemName10}
    pool.query(`INSERT INTO sen_tran SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/admin-kirim-transit.ejs');
    });
});

app.post('/kirim-penerima', (req, res)=>{
    const itemName1 = req.body.id_barang_input;
    const itemName2 = req.body.id_admin_input;
    const itemName3 = req.body.nama_admin_input;
    const itemName4 = req.body.kota_input;
    const itemName5 = req.body.alamat_input;
    const itemName6 = req.body.waktu_pengiriman_input;
    const itemName7 = req.body.resi_input;
    const itemName8 = req.body.id_pengiriman_input;
    var post = {id_barang:itemName1,
                id_admin:itemName2,
                nama_admin:itemName3,
                kota:itemName4,
                alamat:itemName5,
                waktu_pengiriman:itemName6,
                resi:itemName7,
                id_pengiriman:itemName8}
    pool.query(`INSERT INTO sen_rec SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/admin-kirim-penerima.ejs');
    });
});

app.post('/terima-ekspedisi', (req, res)=>{
    const itemName1 = req.body.id_barang_input;
    const itemName2 = req.body.nama_cabang_input;
    const itemName3 = req.body.id_admin_input;
    const itemName4 = req.body.nama_admin_input;
    const itemName5 = req.body.waktu_penerimaan_input;
    const itemName6 = req.body.resi_input;
    const itemName7 = req.body.id_ekspedisi_input;
    var post = {id_barang:itemName1,
                nama_cabang_sebelum:itemName2,
                id_admin:itemName3,
                nama_admin:itemName4,
                waktu_penerimaan:itemName5,
                resi:itemName6,
                id_ekspedisi:itemName7}
    pool.query(`INSERT INTO rec_exp SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/admin-terima-ekspedisi.ejs');
    });
});

app.post('/terima-user', (req, res)=>{
    const itemName1 = req.body.id_barang_input;
    const itemName2 = req.body.nama_barang_input;
    const itemName3 = req.body.nama_pengirim_input;
    const itemName4 = req.body.nama_penerima_input;
    const itemName5 = req.body.kota_input;
    const itemName6 = req.body.alamat_input;
    const itemName7 = req.body.waktu_penerima_user_input;
    const itemName8 = req.body.resi_input;
    const itemName9 = req.body.cabang_penerima_input;
    var post = {id_barang:itemName1,
                nama_barang:itemName2,
                nama_cabang_asal:itemName9,
                nama_pengirim:itemName3,
                nama_penerima:itemName4,
                kota:itemName5,
                alamat:itemName6,
                waktu_penerimaan:itemName7,
                resi_barang:itemName8}
    pool.query(`INSERT INTO rec_user SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/admin-terima-user.ejs');
    });
});

app.get('/admin-terima-ekspedisi.ejs',( req, res)=> {
    res.render('admin-terima-ekspedisi.ejs')
});
