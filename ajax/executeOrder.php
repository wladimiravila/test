<?php

if(isset($_POST) && count($_POST) > 0)
{
    $s_address = trim($_POST['delivery_address']);

    if(!empty($s_address))
    {
        include_once '../inc/sqli.php';

        $sql_tbl_order = 'INSERT INTO `order` SET
                          customer_id = '.$_POST['customer_id'].',
                          delivery_address = "'.mysqli_real_escape_string($sqli, $s_address).'"';

        $b_query_tbl_order = mysqli_query($sqli, $sql_tbl_order);

        if($b_query_tbl_order)
        {
            $i_last_insert_id = mysqli_insert_id($sqli);

            $b_error_in_multi_insert = FALSE;

            foreach($_POST['products_by_client'] as $product_id):

            $sql_tbl_order_detail = 'INSERT INTO order_detail SET
                                     order_id = '.$i_last_insert_id.',
                                     product_description = "'.microtime(TRUE).'",
                                     price = (SELECT product_price FROM product WHERE product_id = '.$product_id.')';

                //echo '<p>'.$sql_tbl_order_detail.'</p>';

            $b_query_tbl_order_detail = mysqli_query($sqli, $sql_tbl_order_detail);

            if(!$b_query_tbl_order_detail)
            {
                $b_error_in_multi_insert = TRUE;
                echo mysqli_error($sqli);
                BREAK;
            }

            endforeach;

            if(!$b_error_in_multi_insert) echo 'Order successfully executed!';

        }else echo mysqli_error($sqli);

    }else echo 'You must supply an address';

}