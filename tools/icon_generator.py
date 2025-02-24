
#pip install military-symbol
import os

import military_symbol

if __name__ == '__main__':
    path = '../assets/images/orbat_icons/unit_types/'

    unit_types = [
        "Combined Arms",
        "Armor",
        "Armored anti-tank",
        "Armor headquarters",
        "Mechanized",
        "Heavy Mechanized Gun",
        #"Infantry Fighting Vehicle",
        "Heavy weapons mechanized",
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
    if not os.path.exists(path):
        os.makedirs(path)

    for unit_type in unit_types:
        unit_type = unit_type.lower()
        unit_descriptor = 'Friendly {}'.format(unit_type)
        example_symbol: military_symbol.individual_symbol.MilitarySymbol = military_symbol.get_symbol_class_from_name(unit_descriptor)
        print('Exporting symbol "{}"'.format(unit_type))

        output_filename = '{}{}.svg'.format(path, unit_type)
        with open(output_filename, 'w') as output_file:
            output_file.write(example_symbol.get_svg(pixel_padding=4))
