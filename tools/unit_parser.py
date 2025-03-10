import json
import re

# Define the input and output file paths
input_file_path = 'units_raw/independent.txt'
output_file_path = '../assets/json/new_units_2.json'

# Function to parse a single line of unit data
def parse_unit_line(line):
    # Regular expression to match the unit data
    match = re.match(r'^(.*?)(?: *- *(\d+(?:,\d+)*))(?: *\((.*?)\))? ?$', line.strip())
    if match:
        name = match.group(1).strip()
        cost = int(match.group(2).replace(',', ''))
        #notes = match.group(3) if match.group(3) else ''
        return {
            'name': name,
            'cost': cost,
            'shop': 'independent',
            'supplyCategory': ''
        }
    return None

# Read the input file and parse the units
units = []
with open(input_file_path, 'r') as file:
    for line in file:
        if line.strip():  # Skip empty lines
            unit = parse_unit_line(line)
            if unit:
                units.append(unit)

# Write the parsed units to the output JSON file
with open(output_file_path, 'w') as file:
    json.dump(units, file, indent=2)

print(f'Parsed {len(units)} units and saved to {output_file_path}')