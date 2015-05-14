<?php include_once 'inc/sqli.php';

$sql = 'SELECT customer_id, name FROM customer';

$o_query = mysqli_query($sqli, $sql);

if(is_object($o_query))
{
    if(mysqli_num_rows($o_query) > 0)
    {
        $options_values = '';

        while($a_rows = mysqli_fetch_assoc($o_query)):

            $options_values .= '<option value="'.$a_rows['customer_id'].'">'.$a_rows['name'].'</option>';

        endwhile;

    }else echo 'no records in tbl customer';

}else echo mysqli_error($sqli);

?>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Available Products by clients</title>
    <script src="inc/script.js"></script>
</head>
<body>
<h2>Available Products by clients</h2>
<?php if(!empty($options_values)){ ?>

<form method="post" name="form_1">
<select name="customer_id" id="customer_id" onchange="if(this.value !== '-- choose --') displayAvailableProductsByClient();"><option>-- choose --</option>'.<?php echo $options_values ?></select>
</form>

<form id="return_from_displayAvailableProductsByClient" name="form_2">

</form>

<div id="return_from_executeOrder"></div>

<?php }else echo 'No clients found in db!' ?>
</body>
</html>