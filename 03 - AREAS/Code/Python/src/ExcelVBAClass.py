#!/usr/bin/env python3

from win32com.client import Dispatch
from pythonmisc import string_manipulation as sm

class ExcelVBAClass(object):

    visible = False
    display_alerts = False
    instance = None

    def __init__(self, visible, alerts):
        self.instance = Dispatch("Excel.Application")
        self.instance.Visible = visible or self.visible
        self.instance.DisplayAlerts = alerts or self.display_alerts

    def get_workbook_from_file(self, filepath, visible, alerts):
        wb = self.instance.Workbooks.Open(filepath)
        wb = Dispatch(wb)
        # Override options, since can be a new file without the configs from self.instance
        self.instance.Visible = visible
        self.instance.DisplayAlerts = alerts
        return wb

    def save_workbook_in_file(self, wb, filepath):
        return wb.saveAs(filepath)

    def add_module(self, wb, name, pattern_type, str_code):
        xlmodule = wb.VBProject.VBComponents.Add(1)
        module_name = (name + pattern_type).encode('ascii', 'ignore')
        # Modules names aren't accepted with special characters (only letters)
        module_name = sm.remove_special_characters(module_name)
        xlmodule.CodeModule.Name = module_name
        xlmodule.CodeModule.AddFromString(str_code)
        return xlmodule

    def add_class(self, wb, name, str_code):
        xlclass = wb.VBProject.VBComponents.Add(2)
        module_name = name.encode('ascii', 'ignore')
        # Modules names aren't accepted with special characters (only letters)
        module_name = sm.remove_special_characters(module_name)
        xlclass.CodeModule.Name = module_name
        xlclass.CodeModule.AddFromString(str_code)
        return xlclass

    def add_form(self, wb):
        xlform = wb.VBProject.VBComponents.Add(3)
        return xlform

    def get_module(self, wb, name, pattern_type):
        try:
            full_name = (name + pattern_type).encode('ascii', 'ignore')
            # Modules names aren't accepted with special characters (only letters)
            full_name = sm.remove_special_characters(full_name)
            return wb.VBProject.VBComponents(full_name)
        except Exception as e:
            # print e.args[2]
            print('Module does not exist!')
            return None

    def import_component(self, wb, name, pattern_type, filepath):
        xlcomponent = wb.VBProject.VBComponents.Import(filepath)
        if pattern_type == 'class':
            module_name = name.encode('ascii', 'ignore')
            # Modules names aren't accepted with special characters (only letters)
            module_name = sm.remove_special_characters(module_name)
            xlcomponent.CodeModule.Name = module_name
        else:
            module_name = (name + pattern_type).encode('ascii', 'ignore')
            # Modules names aren't accepted with special characters (only letters)
            module_name = sm.remove_special_characters(module_name)
            xlcomponent.CodeModule.Name = module_name
        return xlcomponent

    def export_component(self, wb, name, pattern_type, filepath):
        name = name.encode('ascii', 'ignore')
        pattern_type = pattern_type.encode('ascii', 'ignore')
        # Modules names aren't accepted with special characters (only letters)
        name = sm.remove_special_characters(name)
        xlcomponent = self.get_module(wb, name, pattern_type)
        if xlcomponent is not None:
            xlcomponent.Export(filepath)
        else:
            print('Module does not exist and cannot be exported!')

    def destroy(self):
        self.instance.Quit()

    def remove_component(self, wb, name, pattern_type):
        name = name.encode('ascii', 'ignore')
        pattern_type = pattern_type.encode('ascii', 'ignore')
        # Modules names aren't accepted with special characters (only letters)
        name = sm.remove_special_characters(name)
        xlcomponent = self.get_module(wb, name, pattern_type)
        if xlcomponent is not None:
            xlcomponent.Remove()
        else:
            print('Module does not exist and cannot be removed!')

    def remove_all_components(self, wb):
        try:
            # for i in range(1, wb.VBProject.VBComponents.Count + 1):
            for component in wb.VBProject.VBComponents:
                # xlmodule = wb.VBProject.VBComponents(i)
                if component.Type in [1, 2, 3]:
                    wb.VBProject.VBComponents.Remove(component)
        except Exception as e:
            print(e)
