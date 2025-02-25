import re
import json

# Define the regex pattern
regex = r"^ ?(?:\*\*)[\"\' ]*([\w .()\/\-\"]+)(\*?)(?:\*\*) ?- ?([\d,]+%?)"

# Read the content of modifications_raw.txt
with open('modifications_raw.txt', 'r') as file:
    content = file.readlines()

# Parse the content using the regex
modifications = []
for line in content:
    match = re.match(regex, line)
    if match:
        name = match.group(1).strip()
        cost = match.group(3).strip().replace(",", "")
        modification = {
            "name": name,
            "noRestrictions": ("*" in match.group(2))
        }
        if cost.endswith('%'):
            modification["relativeCost"] = float(cost.rstrip('%')) / 100
        else:
            modification["fixedCost"] = int(cost)
        modifications.append(modification)

# Output the parsed modifications in JSON format
with open('modifications.json', 'w') as json_file:
    json.dump(modifications, json_file, indent=2)

print("{} modifications have been parsed and saved to modifications.json".format(len(modifications)))