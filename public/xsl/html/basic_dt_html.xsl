<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="no"/>    
    <xsl:template match="/">
        <!-- Template not found for this language/style combination -->
        &lt;div&gt;
            &lt;h1&gt;Data Table Example&lt;/h1&gt;
            &lt;p&gt;This assumes you already have the required JS needed already loaded (jquery, datatables, etc).&lt;/p&gt;
            &lt;p&gt;If you are not familiar with DT, here is a quick overview: https://datatables.net/manual/installation&lt;/p&gt;
            
        &lt;/div&gt;
        &lt;table id="myTable" class="display" style="width:100%"&gt;
            &lt;thead&gt;
                &lt;tr&gt;
                    <xsl:for-each select="root/bean/dbtable/column">&lt;th&gt;<xsl:value-of select="@name"/>&lt;/th&gt;
                    </xsl:for-each>
                &lt;/tr&gt;
            &lt;/thead&gt;
        &lt;/table&gt;

        &lt;script&gt;
            $(document).ready(function() {
                $('#myTable').DataTable();
            });
        &lt;/script&gt;
    </xsl:template>
</xsl:stylesheet>