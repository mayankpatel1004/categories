<?php
//connect to database
$link = mysqli_connect('localhost','root','');
mysqli_select_db($link,'rec');


//get all rows
$query = mysqli_query($link,'SELECT * FROM categories');
while ( $row = mysqli_fetch_assoc($query) )
{
	$menu_array[$row['id']] = array('name' => $row['name'],'parent' => $row['parent']);
}

//recursive function that prints categories as a nested html unorderd list
function generate_menu($parent)
{
	$has_childs = false;
	//this prevents printing 'ul' if we don't have subcategories for this category

	global $menu_array;
	//use global array variable instead of a local variable to lower stack memory requierment

	foreach($menu_array as $key => $value)
	{
		if ($value['parent'] == $parent) 
		{	
			//if this is the first child print '<ul>'			
			if ($has_childs === false)
			{
				//don't print '<ul>' multiple times
				$has_childs = true;
				echo '<ul>';
			}
			echo '<li><a href="/category/' . $value['name'] . '/">' . $value['name'] . '</a>';
			generate_menu($key);
			//call function again to generate nested list for subcategories belonging to this category
			echo '</li>';
		}
	}
	if ($has_childs === true) echo '</ul>';
}


//generate menu starting with parent categories (that have a 0 parent)
?>
<link rel="stylesheet" href="/expand.css" />
<script src="/expand.js"></script>
<ul id="categories">
<li>Nested menu categories
<?php
generate_menu(0);
?>
</li></ul>
<script>menu_initiate();</script>
