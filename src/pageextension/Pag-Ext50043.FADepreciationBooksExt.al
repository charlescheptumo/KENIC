namespace KICD.KICD;

using Microsoft.FixedAssets.Depreciation;

pageextension 50043 "FA Depreciation Books Ext" extends "FA Depreciation Books Subform"
{
    layout
    {
        modify("Straight-Line %")
        {
            Visible = true;
        }
    }
}
