let
    Source = #"Raw - SAP Extract",
    #"Added Custom" = Table.AddColumn(Source, "Package ID validation", each if [Package Id] = null or Text.Trim(Text.From([Package Id])) = "" then "Missing"
else if Text.Select(Text.Trim(Text.From([Package Id])), {"0".."9"}) = Text.Trim(Text.From([Package Id]))
then "Valid"
else "Invalid"),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Custom",{"Package Id", "Package ID validation", "Game", "Send Date", "Region", "Order Status", "E-commerce", "Stock Quantity", "Preço Unit Price", "Store Manager", "Batch", "Age Rating", "Publisher"})
in
    #"Reordered Columns"