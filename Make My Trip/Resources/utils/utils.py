from robot.api.deco import keyword
import openpyxl
import random
import calendar
from datetime import datetime
from datetime import timedelta

@keyword("Fetch Testdata By Id")
def fetch_testdata_by_id(file_path, target_id):
    global workbook
    try:
        workbook = openpyxl.load_workbook(file_path)
        sheet = workbook.active
        header = [cell.value for cell in sheet[1]]

        for row in sheet.iter_rows(min_row=2, values_only=True):
            if row[0] == target_id:
                data_dict = {}
                for col_name, value in zip(header, row):
                    if ',' in str(value):
                        data_dict[col_name] = [item.strip() for item in value.split(',')]
                    else:
                        data_dict[col_name] = value
                return data_dict

        # If the target_id is not found, you can raise an exception or return a specific value
        raise ValueError(f"Target ID '{target_id}' not found in the Excel file.")
    except Exception as e:
        print(f"Error reading Excel file: {e}")

@keyword
def get_page2_heading(frm, to):
    return f"{frm} to {to} Bus"

@keyword
def get_random_date(current_date_str):
    # Parse input date like "28 Jan26"
    current_date = datetime.strptime(current_date_str, "%d %b%y")

    # Calculate month + 3 (calendar-based)
    target_month = current_date.month + 3
    target_year = current_date.year

    if target_month > 12:
        target_month -= 12
        target_year += 1

    # Get last day of the target month
    last_day = calendar.monthrange(target_year, target_month)[1]
    max_date = datetime(target_year, target_month, last_day)

    # Total days in allowed range
    total_days = (max_date - current_date).days

    # Generate random offset (including current date)
    random_offset = random.randint(0, total_days)

    random_date = current_date + timedelta(days=random_offset)

    return random_date.strftime("%b %d %Y")
