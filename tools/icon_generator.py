
#pip install military-symbol
import os

import military_symbol

if __name__ == '__main__':
    unit_types = [
        "Combined Arms",
        "Armor",
        "Armored anti-tank",
        "Armor headquarters",
        "Mechanized",
        #"Infantry Fighting Vehicle",
        "Reconnaissance",
        "Armored Cavalry",
        "Motorized Cavalry",
        "Mortar",
        "Motorized Mortar",
        "Motorized Infantry",
        "Motorized Anti-tank",
        "Infantry",
        "Air mobile Infantry",
        "Airborne Infantry",
        "Infantry headquarters",
        "Engineer",
        "Armored Engineer",
        "Multiple rocket launcher artillery",
        "Wheeled Multiple rocket launcher artillery",
        "Self-propelled artillery",
        "Wheeled self-propelled artillery",
        "Tracked self-propelled artillery",
        "Anti-air missile",
        "Wheeled Anti-air missile",
        "Tracked anti-air missile",
        "Wheeled anti-air gun",
        "Tracked anti-air gun",
        "Supply",
        "Generic"
    ]
    
    unit_sizes = [
        "Squad",
        "Platoon", 
        "Company",
        "Battalion",
        "Regiment",
        "Brigade",
        "Division"
    ]
    
    for unit_type in unit_types:
        for unit_size in unit_sizes:
            unit_type, unit_size = unit_type.lower(), unit_size.lower()
            unit_descriptor = 'Friendly {} {}'.format(unit_type, unit_size)
            example_symbol: military_symbol.individual_symbol.MilitarySymbol = military_symbol.get_symbol_class_from_name(unit_descriptor)
            print('Exporting symbol "{} {}"'.format(unit_type, unit_size))
            
            if not os.path.exists(unit_type):
                os.makedirs(unit_type)
            output_filename = '{}/{}.svg'.format(unit_type, unit_size)
            with open(output_filename, 'w') as output_file:
                output_file.write(example_symbol.get_svg(pixel_padding=4))
