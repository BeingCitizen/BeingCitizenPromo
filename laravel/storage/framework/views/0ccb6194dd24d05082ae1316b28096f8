<?php
$name=str_replace("@","",$name);
$name=str_replace(" ","%",$name);
$sql_res=mysql_query("select * from tag_table where name like '%$name%' order by id LIMIT 5");
while($row=mysql_fetch_array($sql_res))
{
$name=$row['name'];
?>
<div class="display_box" >
<a href="#" class='addname' title='<?php echo $fname; ?>'>
<?php echo $fname; ?></a>
</div>
<?php
}
}
?>