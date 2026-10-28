let
    Source = #"QA - Source Validation",
    #"Filtered Rows" = Table.SelectRows(Source, each ([Package ID validation] <> "Valid")),
    #"Added Conditional Column" = Table.AddColumn(#"Filtered Rows", "Rejection Reason", each if [Package ID validation] = "Invalid" then "Invalid Package ID format" else if [Package ID validation] = "Missing" then "Missing Package ID" else "Review required"),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Conditional Column",{"Package Id", "Package ID validation", "Rejection Reason", "Game", "Send Date", "Region", "Order Status", "E-commerce", "Stock Quantity", "Preço Unit Price", "Store Manager", "Batch", "Age Rating", "Publisher"})
in
    #"Reordered Columns"