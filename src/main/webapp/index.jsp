<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
    --bg:#0f172a;
    --card:#1e293b;
    --text:#e2e8f0;
    --muted:#94a3b8;
    --accent:#6366f1;
    --radius:14px;
}

*{box-sizing:border-box;margin:0;padding:0}

body{
    font-family:Inter;
    background:var(--bg);
    color:var(--text);
}

.container{max-width:1200px;margin:auto;padding:20px}

/* HEADER */
header{
    position:sticky;top:0;
    backdrop-filter:blur(10px);
    background:rgba(15,23,42,0.7);
    border-bottom:1px solid rgba(255,255,255,0.05);
}

.header-inner{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.brand{
    font-family:Poppins;
    font-size:20px;
    font-weight:700;
}

.brand span{color:var(--accent)}

.search{
    background:#1e293b;
    padding:8px 12px;
    border-radius:999px;
    display:flex;
    align-items:center;
}

.search input{
    background:none;border:none;
    color:white;outline:none;
}

.icon-btn{background:none;border:none;color:white;cursor:pointer}

/* HERO */
.hero{
    text-align:center;
    padding:80px 20px;
    background:linear-gradient(120deg,#6366f1,#0ea5e9);
    border-radius:0 0 20px 20px;
}

.hero h1{font-size:42px;margin-bottom:10px}

.btn{
    padding:12px 18px;
    border:none;
    border-radius:999px;
    cursor:pointer;
    font-weight:600;
}

.btn-primary{
    background:linear-gradient(135deg,#6366f1,#8b5cf6);
    color:white;
}

/* GRID */
.grid{display:grid;gap:20px}
.products{grid-template-columns:repeat(auto-fit,minmax(240px,1fr))}

/* PRODUCT */
.product{
    background:var(--card);
    border-radius:var(--radius);
    overflow:hidden;
    position:relative;
    transition:.3s;
}

.product:hover{
    transform:translateY(-6px);
}

.product img{
    width:100%;
    height:200px;
    object-fit:cover;
}

.product-body{padding:12px}

.price{font-weight:700}

.overlay{
    position:absolute;
    inset:0;
    background:rgba(0,0,0,0.6);
    display:flex;
    justify-content:center;
    align-items:center;
    opacity:0;
    transition:.3s;
}

.product:hover .overlay{opacity:1}

.quick{
    background:white;
    padding:10px 14px;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

/* CATEGORY */
.categories{grid-template-columns:repeat(auto-fit,minmax(140px,1fr))}
.cat-card{
    background:var(--card);
    padding:20px;
    text-align:center;
    border-radius:var(--radius);
    transition:.3s;
}
.cat-card:hover{transform:translateY(-5px)}

/* FOOTER */
footer{
    text-align:center;
    padding:30px;
    color:var(--muted);
}

</style>

</head>

<body>

<header>
<div class="container header-inner">
<div class="brand">Nexus<span>Shop</span></div>

<div class="search">
<input type="text" id="searchInput" placeholder="Search...">
<button class="icon-btn" id="searchBtn"><i class="fas fa-search"></i></button>
</div>

<div>
<button class="icon-btn"><i class="fas fa-shopping-cart"></i> <span id="cartCount">0</span></button>
</div>
</div>
</header>

<!-- HERO -->

<section class="hero">
<h1>Modern Shopping Experience</h1>
<p>Premium UI with smooth experience</p>
<button class="btn btn-primary" id="shopNow">Shop Now</button>
</section>

<!-- CATEGORIES -->

<section class="container">
<h2>Categories</h2>
<div class="grid categories" id="categoriesGrid"></div>
</section>

<!-- PRODUCTS -->

<section class="container">
<h2>Products</h2>
<div class="grid products" id="productsGrid"></div>
</section>

<footer>
© <span id="year"></span> NexusShop
</footer>

<script>

const CATEGORIES=[
{name:'Phones',icon:'fa-mobile'},
{name:'Laptops',icon:'fa-laptop'},
{name:'Fashion',icon:'fa-shirt'},
{name:'Shoes',icon:'fa-shoe-prints'}
];

const PRODUCTS=[
{id:1,title:'iPhone 14',price:999,img:'https://images.unsplash.com/photo-1601784551446'},
{id:2,title:'MacBook',price:1999,img:'https://images.unsplash.com/photo-1593642632823'},
{id:3,title:'Headphones',price:199,img:'https://images.unsplash.com/photo-1600185365483'},
{id:4,title:'Shoes',price:120,img:'https://images.unsplash.com/photo-1542291026'}
];

let cart=0;

function renderCategories(){
const el=document.getElementById('categoriesGrid');
CATEGORIES.forEach(c=>{
el.innerHTML+=`
<div class="cat-card">
<i class="fas ${c.icon}"></i>
<h4>${c.name}</h4>
</div>`;
});
}

function renderProducts(){
const el=document.getElementById('productsGrid');
PRODUCTS.forEach(p=>{
el.innerHTML+=`
<div class="product">
<img src="${p.img}">
<div class="overlay"><button class="quick">View</button></div>
<div class="product-body">
<h4>${p.title}</h4>
<div class="price">$${p.price}</div>
<button onclick="addToCart()">Add</button>
</div>
</div>`;
});
}

function addToCart(){
cart++;
document.getElementById('cartCount').innerText=cart;
}

document.getElementById('year').innerText=new Date().getFullYear();

renderCategories();
renderProducts();

</script>

</body>
</html>
