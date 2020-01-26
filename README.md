# Project3
Project3 Django pinnochio Pizza n subs
<h1>Breafly explanation of how it works</h1>
<ol>
    <li>The authentication system was made using the django authentication system</li>
    <li>All the menu of Pinnochio's Pizza n subs is right now in the database</li>
    <li>In the model of the data base, you can see this princpal tables:</li>
    <ul>
        <li>Productos: where the main categories of products are</li>
        <li>Subtipo: The especial kind of prodcutos are here, like sub with extra chesee, or regular pizza or sicilian
        </li>
        <li>Prod_tam_sub: is a table where I created all the products and their main features giving them a price</li>
        <li>Carrito compras: here are placed all the elements of all users that exist in their shopping carts, when a
            user make an order, this is deleted </li>
        <li>Toppings: the pizza toppings </li>
    </ul>
    <li>The admin can create a new element by create a new subtipo elemento where he will place the main name of the product and afterwards, he must to create a prod_tam_sub, where he will asociate the price and other features like size and product type</li>
    <li>Users registrated by the web app, dont have admin privilegies</li>
    <li>The shopping cart is a table in dB because in that way, users wont lose their shopppings at loggout</li>
    <li>users not logged cant created an order. Users logged in, can created and give a address for the shopping</li>
    <li>The admin can see in the admin place all the ordes created using a table called ordenes, this table has a table related prod_ordenes,this one has all the products that an orden must have </li>
    <li>like personal touch, user can see the ordes that they already send and the status that the admin has put to it</li>

</ol>