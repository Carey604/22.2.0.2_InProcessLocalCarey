permissionset 52400 "CATEM Email"
{
    // CAT.001 2023-06-29 new permission set

    Assignable = true;
    Caption = 'CATWF Workflow';

    Permissions =
        // tabledata "CATPR Purchase Req. Status" = RIMD,
        // tabledata "CATPR Purchase Req. Priority" = RIMD,
        // codeunit "CATPR Event Subscribers" = X
        ;

    //>>Examples
    // Permissions =
    //   tabledata Item = RIMD,
    //   page "Item Card" = X,
    //   codeunit "Item Category Management" = X,
    //   report "Standard Purchase - Order" = X;
    //
    //<<Examples
}