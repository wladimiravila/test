function displayAvailableProductsByClient()
{

    document.getElementById('return_from_displayAvailableProductsByClient').innerHTML = '...wait';
    var oData = new FormData(document.forms.namedItem('form_1'));

    var oReq = new XMLHttpRequest();

    oReq.open('POST', 'ajax/displayAvailableProductsByClient.php', true);

    oReq.onload = function(oEvent)
    {
        if (oReq.status === 200)
        {
            document.getElementById('return_from_displayAvailableProductsByClient').innerHTML = oReq.responseText;

        }else
        {
            document.getElementById('return_from_displayAvailableProductsByClient').innerHTML = 'Error ' + oReq.status;
        }
    }

    oReq.send(oData);
}


function executeOrder()
{
    document.getElementById('return_from_executeOrder').innerHTML = '...wait';

    var oData = new FormData(document.forms.namedItem('form_2'));

    oData.append('customer_id', document.getElementById('customer_id').value);

    var oReq = new XMLHttpRequest();

    oReq.open('POST', 'ajax/executeOrder.php', true);

    oReq.onload = function(oEvent)
    {
        if (oReq.status === 200)
        {
            document.getElementById('return_from_executeOrder').innerHTML = oReq.responseText;

        }else
        {
            document.getElementById('return_from_executeOrder').innerHTML = 'Error ' + oReq.status;
        }
    }

    oReq.send(oData);
}

function makeSumOfSelectedProducts()
{
    document.getElementById('return_from_makeSumOfSelectedProducts').innerHTML = '...wait';

    var selectMultiple = document.getElementById('products_by_client');

    var productsIdToSum = [];

    for(var i = 0; i < selectMultiple.options.length; i++)
    {
        if(selectMultiple.options[i].selected)
        {
            productsIdToSum.push(selectMultiple.options[i].value);
        }
    }

    var oData = new FormData(document.forms.namedItem('return_from_displayAvailableProductsByClient'));

    oData.append('productsIdToSum', productsIdToSum);

    var oReq = new XMLHttpRequest();

    oReq.open('POST', 'ajax/makeSumOfSelectedProducts.php', true);

    oReq.onload = function(oEvent)
    {
        if (oReq.status === 200)
        {
            document.getElementById('return_from_makeSumOfSelectedProducts').innerHTML = oReq.responseText;

        }else
        {
            document.getElementById('return_from_makeSumOfSelectedProducts').innerHTML = 'Error ' + oReq.status;
        }
    }

    oReq.send(oData);
}