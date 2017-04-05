

<hr style="width:800px;" align="left"/>
#### Force full GC

```sh

>jmap -histo:live {process_id}

```


#### Guidelines for Calculating Java Heap Sizing

https://docs.oracle.com/cd/E19159-01/819-3681/abeij/index.html


<table border="1">
	<caption>Guidelines for Calculating Java Heap Sizing</caption>
	<thead>
		<tr>
			<th>Space</th>
			<th>Command Line Option</th>
			<th>Occupancy Factor</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Java heap</td>
			<td>-Xms and -Xmx</td>
			<td>
				3x to 4x old generation space occupancy
				after full garbage collection
			</td>
		</tr>
		<tr>
			<td>
				Permanent <br />
				Generation
			</td>
			<td>
				-XX:PermSize <br /> 
				-XX:MaxPermSize
			</td>
			<td>
				1.2x to 1.5x permanent generation space <br /> 
				occupancy after full garbage collection
			</td>
		</tr>
		<tr>
			<td>Young Generation</td>
			<td>-Xmn</td>
			<td>
				1x to 1.5x old generation space <br />  
				occupancy after full garbage collection
			</td>
		</tr>
		<tr>
			<td>Old Generation </td>
			<td>
				Implied from overall Java <br />  
				heap size minus the young <br />  
				generation size
			</td>
			<td>
				2x to 3x old generation space occupancy <br /> 
				after full garbage collection
			</td>
		</tr>									
	</tbody>
</table>