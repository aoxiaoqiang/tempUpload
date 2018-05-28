<include file="public:header" />

<div class="subnav">

    <h1 class="title_2 line_x">阿里妈妈数据导入</h1>

</div>



<div class="pad_lr_10">

    <table width="100%" cellspacing="0" class="table_form">

	

        <tr>

            <th width="150">选择采集后入库的对应分类 :</th>

            <td>
     <form action="{:U('alimama/impUser')}" method="post" enctype="multipart/form-data">
            <input type="file" name="import"/>
            <input type="hidden" name="table" value="tablename"/>
            <input type="submit" value="导入"/>
  </form>
            
            </td>

        </tr>

      
    </table>



</div>

<include file="public:footer" />



</body>

</html>



