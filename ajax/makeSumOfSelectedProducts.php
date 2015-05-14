<?php

if(isset($_POST) && count($_POST) > 0)
{
    include_once '../inc/sqli.php';

    $sql = 'SELECT SUM(`product_price`) AS total
            FROM `product`
            WHERE `product_id` IN ('.$_POST['productsIdToSum'].')';


    $o_query = mysqli_query($sqli, $sql);

    if(is_object($o_query))
    {
        if(mysqli_num_rows($o_query) === 1)
        {
            $a_rows = mysqli_fetch_assoc($o_query);

            $sxe = new SimpleXMLElement('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml', NULL, TRUE);

            $i_usd_rate = (float)$sxe->Cube->Cube->Cube->attributes()['rate'];

            echo '<b>Total: </b>'.$a_rows['total'].' € ('.$a_rows['total'] * $i_usd_rate.' $)';

            echo '<p><input type="text" placeholder="delivery_address" name="delivery_address" id="delivery_address" /></p>';

            echo '<p><a href="#" onclick="executeOrder();">Order</a></p>';

        }else echo 'no records found for this query';

    }else echo mysqli_error($sqli);
}