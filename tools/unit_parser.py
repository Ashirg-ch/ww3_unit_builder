import os
import json
import re

# Define the input and output file paths
input_folder_path = 'units_raw'
output_file_path = '../assets/json/new_units_2.json'
reference_file_path = '../assets/json/units.json'

# Function to parse a single line of unit data
def parse_unit_line(line, reference_units, shop):
    # Regular expression to match the unit data, including optional FP in parentheses
    match = re.match(r'^(.*?)(?: *- *(\d+(?:,\d+)*)) *(?:\((\d+) FP\))?(?: \(.+\))? ?$', line.strip(), re.IGNORECASE)
    if match:
        name = match.group(1).strip()
        cost = int(match.group(2).replace(',', ''))
        fp = int(match.group(3)) if match.group(3) else None
        supply_category = reference_units.get(name, '')
        unit = {
            'name': name,
            'cost': cost,
            'shop': shop,
            'supplyCategory': supply_category
        }
        if fp is not None:
            unit['fp'] = fp
        return unit
    return None

# Load the reference units
with open(reference_file_path, 'r') as file:
    reference_units = {unit['name']: unit['supplyCategory'] for unit in json.load(file)}

# Read all files in the input folder and parse the units
units = []
for filename in os.listdir(input_folder_path):
    if filename.endswith('.txt'):
        shop = filename.replace('.txt', '')  # Derive shop name from file name
        file_path = os.path.join(input_folder_path, filename)
        with open(file_path, 'r') as file:
            for line in file:
                if line.strip():  # Skip empty lines
                    unit = parse_unit_line(line, reference_units, shop)
                    if unit:
                        units.append(unit)

# Write the parsed units to the output JSON file
with open(output_file_path, 'w') as file:
    json.dump(units, file, indent=2)

print(f'Parsed {len(units)} units from {input_folder_path} and saved to {output_file_path}')