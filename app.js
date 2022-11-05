const express = require('express');
const app = express();
const session = require('express-session');
const path = require('path');
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


// TAMPILKAN DATA CABANG 
app.get('/sa-form-cabang.ejs',( req, res)=> {
   
    res.render('sa-form-cabang.ejs' )
});

app.get('/sa-tambah-cabang.ejs',( req, res)=> {
    pool.query('select * from table_cabang', (error, result)=>{
        if (error) throw error        
    res.render('sa-tambah-cabang.ejs', {items:result});
    })
});


// TAMPILKAN DATA KARYAWAN
app.get('/sa-form-karyawan.ejs',( req, res)=> {
    res.render('sa-form-karyawan.ejs')
});


app.get('/sa-tambah-karyawan.ejs',( req, res)=> {
    pool.query('select * from table_karyawan', (error, result)=>{
        if (error) throw error        
    res.render('sa-tambah-karyawan.ejs', {items:result});
    })
});

// TAMPILKAN DATA AKUN USER DAN ADMIN
app.get('/sa-manajemen-akun.ejs',( req, res)=> {
    res.render('sa-manajemen-akun.ejs')
});

// USER
app.get('/sa-m-akun-user.ejs',( req, res)=> {
    pool.query('select * from table_user', (error, result)=>{
        if (error) throw error        
    res.render('sa-m-akun-user.ejs', {items:result});
    })
});

app.get('/sa-form-user.ejs',( req, res)=> {
    res.render('sa-form-user.ejs')
});


// TAMPILKAN DATA ADMIN
app.get('/sa-m-akun-admin.ejs',( req, res)=> {
    pool.query('select * from table_admin', (error, result)=>{
        if (error) throw error        
    res.render('sa-m-akun-admin.ejs', {items:result});
    })
});

app.get('/sa-form-admin.ejs',( req, res)=> {
    res.render('sa-form-admin.ejs')
});

// DELETE DATA ADMIN
app.get('/delete-adm', function (req, res, next){
    pool.query('DELETE FROM table_admin', req.query.admin_id, (error, result)=>{
        if (error) throw error
    
        res.render('sa-m-akun-admin.ejs'), {items:result}
    });
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


// KIRIM BARANG KE CABANG / TRANSIT
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


// KIRIM BARANG KE PENERIMA
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


// TERIMA BARANG DARI CABANG LAIN
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

// FORM TERIMA BARANG DARI USER
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

// TAMBAH USER
app.post('/add-user', (req, res)=>{
    const itemName1 = req.body.username;
    const itemName2 = req.body.password;
    var post = {username:itemName1,
                password:itemName2}
    pool.query(`INSERT INTO table_user SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/sa-m-akun-user.ejs');
    });
});

// TAMBAH ADMIN
app.post('/add-admin', (req, res)=>{
    const itemName1 = req.body.admin_input;
    const itemName2 = req.body.password_input;
    var post = {admin_email:itemName1,
                password_password:itemName2}
    pool.query(`INSERT INTO table_admin SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/sa-m-akun-admin.ejs');
    });
});


// TAMBAH DATA CABANG
app.post('/add-cabang', (req, res)=>{
    const itemName1 = req.body.id_cabang;
    const itemName2 = req.body.nama_cabang;
    const itemName3 = req.body.lokasi;
    var post = {id_cabang:itemName1,
                nama_cabang:itemName2,
                lokasi:itemName3}
    pool.query(`INSERT INTO table_cabang SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/sa-tambah-cabang.ejs');
    });
});


// TAMBAH DATA KARYAWAN
app.post('/add-karyawan', (req, res)=>{
    const itemName1 = req.body.id_karyawan;
    const itemName2 = req.body.nama_karyawan;
    const itemName3 = req.body.cabang_karyawan;
    var post = {id_karyawan:itemName1,
                nama_karyawan:itemName2,
                cabang_karyawan:itemName3}
    pool.query(`INSERT INTO table_karyawan SET ?` , post, (error, results)=>{
        if(error){
            throw error;
        }
        res.redirect('/sa-tambah-karyawan.ejs');
    });
});


// Untuk Login
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));


// http://localhost:3000/
app.get('/', function(request, response) {
	// Render login template
	response.sendFile(path.join(__dirname + '/login.html'));
});

// http://localhost:3000/auth
app.post('/auth', function(request, response) {
	// Capture the input fields
	let username = request.body.username;
	let password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		pool.query('SELECT * FROM superadmin_tabel WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;
			// If the account exists
			if (results.length > 0) {
				// Authenticate the user
				request.session.loggedin = true;
				request.session.username = username;
				// Redirect to home page
				response.redirect('/admin.ejs');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});


// http://localhost:3000/auth
app.post('/auth', function(request, response) {
	// Capture the input fields
	let username = request.body.username;
	let password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		pool.query('SELECT * FROM table_user WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;
			// If the account exists
			if (results.length > 0) {
				// Authenticate the user
				request.session.loggedin = true;
				request.session.username = username;
				// Redirect to home page
				response.redirect('/user-lapor.ejs');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

// http://localhost:3000/home
app.get('/admin', function(request, response) {
	// If the user is loggedin
	if (request.session.loggedin) {
		// Output username
		response.send('Welcome back, ' + request.session.username + '!');
	} else {
		// Not logged in
		response.send('Please login to view this page!');
	}
	response.end();
});



app.get('/admin-terima-ekspedisi.ejs',( req, res)=> {
    res.render('admin-terima-ekspedisi.ejs')
});
