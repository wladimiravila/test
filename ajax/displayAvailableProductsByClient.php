<?php

if(isset($_POST) && count($_POST) > 0)
{
    $sql = ' SELECT product.name, product.product_id
            FROM `product`
            INNER JOIN customer_related_product ON product.product_id = customer_related_product.product_id_rp
            WHERE `customer_id_rp` = '.$_POST['customer_id'];

    include_once '../inc/sqli.php';

    $o_query = mysqli_query($sqli, $sql);

    if(is_object($o_query))
    {
        if(mysqli_num_rows($o_query) > 0)
        {
            echo '<p>Below is the list of available products for that client: </p>';

            $options_multiple_products = '<div style="float: left;"><select id="products_by_client" name="products_by_client[]" multiple="multiple">';

            while($a_rows = mysqli_fetch_assoc($o_query)):

                $options_multiple_products .= '<option onclick="makeSumOfSelectedProducts();" value="'.$a_rows['product_id'].'">'.$a_rows['name'].'</option>';

            endwhile;

            echo $options_multiple_products.'</select></div>';

            echo '<div style="float: left; margin-left: 20px;" id="return_from_makeSumOfSelectedProducts"></div>';

        }else echo 'no records found for this query';

    }else echo mysqli_error($sqli);
}