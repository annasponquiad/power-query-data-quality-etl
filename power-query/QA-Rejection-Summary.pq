let
    Source = #"QA - Rejected Records",
    #"Grouped Rows" = Table.Group(Source, {"Rejection Reason"}, {{"Rejected Record Count", each Table.RowCount(_), Int64.Type}})
in
    #"Grouped Rows"