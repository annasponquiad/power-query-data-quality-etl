let
    RawCount = Table.RowCount(#"Raw - SAP Extract"),
    AcceptedCount = Table.RowCount(#"SAP-EXTRACT"),
    RejectedCount = Table.RowCount(#"QA - Rejected Records"),

    Reconciliation = #table(
        {"Raw Records", "Accepted Records", "Rejected Records"},
        {{RawCount, AcceptedCount, RejectedCount}}
    ),
    #"Added Custom" = Table.AddColumn(Reconciliation, "Unaccounted Records", each [Raw Records]-[Accepted Records]-[Rejected Records]),
    #"Added Conditional Column" = Table.AddColumn(#"Added Custom", "Reconciliation Status", each if [Unaccounted Records] = 0 then "Balanced" else "Mismatch"),
    #"Changed Type" = Table.TransformColumnTypes(#"Added Conditional Column",{{"Raw Records", Int64.Type}, {"Accepted Records", Int64.Type}, {"Rejected Records", Int64.Type}, {"Unaccounted Records", Int64.Type}, {"Reconciliation Status", type text}})
in
    #"Changed Type"