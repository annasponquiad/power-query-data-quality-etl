let
    Source = Excel.Workbook(File.Contents("C:\PATH\TO\YOUR\DATA\DIO_practice_book2.xlsx"), null, true),
    #"SAP-EXTRACT_Sheet" = Source{[Item="SAP-EXTRACT",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(#"SAP-EXTRACT_Sheet", [PromoteAllScalars=true])
in
    #"Promoted Headers"