require 'zip'
require 'json'
# require 'byebug'

def new_licensee(code)
	licensees = {
		"00" => "None",
		"01" => "Nintendo R&D1",
		"08" => "Capcom",
		"13" => "Electronic Arts",
		"18" => "Hudson Soft",
		"19" => "b-ai",
		"20" => "kss",
		"22" => "pow",
		"24" => "PCM Complete",
		"25" => "san-x",
		"28" => "Kemco Japan",
		"29" => "seta",
		"30" => "Viacom",
		"31" => "Nintendo", 
		"32" => "Bandai",
		"33" => "Ocean/Acclaim",
		"34" => "Konami",
		"35" => "Hector",
		'36' => 'Ocean',
		"37" => "Taito",
		"38" => "Hudson",
		"39" => "Banpresto",
		"41" => "Ubi Soft",
		"42" => "Atlus",
		"44" => "Malibu",
		"45" => "Natsume",
		"46" => "angel",
		"47" => "Bullet-Proof",
		"49" => "irem",
		"50" => "Absolute",
		"51" => "Acclaim",
		"52" => "Activision",
		"53" => "American sammy",
		"54" => "Konami",
		"55" => "Hi tech entertainment",
		"56" => "LJN",
		"57" => "Matchbox",
		"58" => "Mattel",
		"59" => "Milton Bradley",
		"60" => "Titus",
		"61" => "Virgin",
		"64" => "LucasArts",
		"67" => "Ocean",
		"69" => "Electronic Arts",
		"70" => "Infogrames",
		"71" => "Interplay",
		"72" => "Broderbund",
		"73" => "sculptured",
		"75" => "sci",
		"78" => "THQ",
		"79" => "Accolade",
		"80" => "misawa",
		"83" => "lozc",
		"86" => "Tokuma Shoten Intermedia",
		"87" => "Tsukuda Original",
		"91" => "Chunsoft",
		"92" => "Video system",
		"93" => "Ocean/Acclaim",
		"95" => "Varie",
		"96" => "Yonezawa/s’pal",
		"97" => "Kaneko",
		"99" => "Pack in soft",
		"9H" => "Bottom Up",
		"A4" => "Konami (Yu-Gi-Oh!)"
	}

	licensees[code.upcase] || "Unknown code: #{code.upcase}"
end

def old_licensee(code)
	licensees = {
		'00' => 'None',
		'01' => 'Nintendo',
		'08' => 'Capcom',
		'09' => 'Hot-B',
		'0A' => 'Jaleco',
		'0B' => 'Coconuts Japan',
		'0C' => 'Elite Systems',
		'13' => 'EA (Electronic Arts)',
		'18' => 'Hudsonsoft',
		'19' => 'ITC Entertainment',
		'1A' => 'Yanoman',
		'1D' => 'Japan Clary',
		'1F' => 'Virgin Interactive',
		'24' => 'PCM Complete',
		'25' => 'San-X',
		'28' => 'Kotobuki Systems',
		'29' => 'Seta',
		'30' => 'Infogrames',
		'31' => 'Nintendo',
		'32' => 'Bandai',
		'33' => 0x33, # indicates that the new licensee should be used
		'34' => 'Konami',
		'35' => 'HectorSoft',
		'36' => 'Ocean',
		'38' => 'Capcom',
		'39' => 'Banpresto',
		'3C' => '.Entertainment i',
		'3E' => 'Gremlin',
		'41' => 'Ubisoft',
		'42' => 'Atlus',
		'44' => 'Malibu',
		"45" => "Natsume",
		'46' => 'Angel',
		'47' => 'Spectrum Holoby',
		'49' => 'Irem',
		'4A' => 'Virgin Interactive',
		'4D' => 'Malibu',
		'4F' => 'U.S. Gold',
		'50' => 'Absolute',
		'51' => 'Acclaim',
		'52' => 'Activision',
		'53' => 'American Sammy',
		'54' => 'GameTek',
		'55' => 'Park Place',
		'56' => 'LJN',
		'57' => 'Matchbox',
		'59' => 'Milton Bradley',
		'5A' => 'Mindscape',
		'5B' => 'Romstar',
		'5C' => 'Naxat Soft',
		'5D' => 'Tradewest',
		'60' => 'Titus',
		'61' => 'Virgin Interactive',
		'67' => 'Ocean Interactive',
		'69' => 'EA (Electronic Arts)',
		'6E' => 'Elite Systems',
		'6F' => 'Electro Brain',
		'70' => 'Infogrames',
		'71' => 'Interplay',
		'72' => 'Broderbund',
		'73' => 'Sculptered Soft',
		'75' => 'The Sales Curve',
		'78' => 't.hq',
		'79' => 'Accolade',
		'7A' => 'Triffix Entertainment',
		'7C' => 'Microprose',
		'7F' => 'Kemco',
		'80' => 'Misawa Entertainment',
		'83' => 'Lozc',
		'86' => 'Tokuma Shoten Intermedia',
		'8B' => 'Bullet-Proof Software',
		'8C' => 'Vic Tokai',
		'8E' => 'Ape',
		'8F' => 'I’Max',
		'91' => 'Chunsoft Co.',
		'92' => 'Video System',
		'93' => 'Tsubaraya Productions Co.',
		'95' => 'Varie Corporation',
		'96' => 'Yonezawa/S’Pal',
		'97' => 'Kaneko',
		'99' => 'Arc',
		'9A' => 'Nihon Bussan',
		'9B' => 'Tecmo',
		'9C' => 'Imagineer',
		'9D' => 'Banpresto',
		'9F' => 'Nova',
		'A1' => 'Hori Electric',
		'A2' => 'Bandai',
		'A4' => 'Konami',
		'A6' => 'Kawada',
		'A7' => 'Takara',
		'A9' => 'Technos Japan',
		'AA' => 'Broderbund',
		'AC' => 'Toei Animation',
		'AD' => 'Toho',
		'AF' => 'Namco',
		'B0' => 'acclaim',
		'B1' => 'ASCII or Nexsoft',
		'B2' => 'Bandai',
		'B4' => 'Square Enix',
		'B6' => 'HAL Laboratory',
		'B7' => 'SNK',
		'B9' => 'Pony Canyon',
		'BA' => 'Culture Brain',
		'BB' => 'Sunsoft',
		'BD' => 'Sony Imagesoft',
		'BF' => 'Sammy',
		'C0' => 'Taito',
		'C2' => 'Kemco',
		'C3' => 'Squaresoft',
		'C4' => 'Tokuma Shoten Intermedia',
		'C5' => 'Data East',
		'C6' => 'Tonkinhouse',
		'C8' => 'Koei',
		'C9' => 'UFL',
		'CA' => 'Ultra',
		'CB' => 'Vap',
		'CC' => 'Use Corporation',
		'CD' => 'Meldac',
		'CE' => '.Pony Canyon or',
		'CF' => 'Angel',
		'D0' => 'Taito',
		'D1' => 'Sofel',
		'D2' => 'Quest',
		'D3' => 'Sigma Enterprises',
		'D4' => 'ASK Kodansha Co.',
		'D6' => 'Naxat Soft',
		'D7' => 'Copya System',
		'D9' => 'Banpresto',
		'DA' => 'Tomy',
		'DB' => 'LJN',
		'DD' => 'NCS',
		'DE' => 'Human',
		'DF' => 'Altron',
		'E0' => 'Jaleco',
		'E1' => 'Towa Chiki',
		'E2' => 'Yutaka',
		'E3' => 'Varie',
		'E5' => 'Epcoh',
		'E7' => 'Athena',
		'E8' => 'Asmik ACE Entertainment',
		'E9' => 'Natsume',
		'EA' => 'King Records',
		'EB' => 'Atlus',
		'EC' => 'Epic/Sony Records',
		'EE' => 'IGS',
		'F0' => 'A Wave',
		'F3' => 'Extreme Entertainment',
		'FF' => 'LJN'
	}
	licensees[code.upcase] || code.upcase
end

def mapper(code)
	mappers = {
		"0" =>	"ROM ONLY",
		"1" =>	"MBC1",
		"2" =>	"MBC1+RAM",
		"3" =>	"MBC1+RAM+BATTERY",
		"5" =>	"MBC2",
		"6" =>	"MBC2+BATTERY",
		"8" =>	"ROM+RAM",
		"9" =>	"ROM+RAM+BATTERY",
		"B" =>	"MMM01",
		"C" =>	"MMM01+RAM",
		"D" =>	"MMM01+RAM+BATTERY",
		"F" =>	"MBC3+TIMER+BATTERY",
		"10" =>	"MBC3+TIMER+RAM+BATTERY",
		"11" =>	"MBC3",
		"12" =>	"MBC3+RAM",
		"13" =>	"MBC3+RAM+BATTERY",
		"19" =>	"MBC5",
		"1A" =>	"MBC5+RAM",
		"1B" =>	"MBC5+RAM+BATTERY",
		"1C" =>	"MBC5+RUMBLE",
		"1D" =>	"MBC5+RUMBLE+RAM",
		"1E" =>	"MBC5+RUMBLE+RAM+BATTERY",
		"20" =>	"MBC6",
		"22" =>	"MBC7+SENSOR+RUMBLE+RAM+BATTERY",
		"FC" =>	"POCKET CAMERA",
		"FD" =>	"BANDAI TAMA5",
		"FE" =>	"HuC3",
		"FF" =>	"HuC1+RAM+BATTERY"
	}
	mappers[code.upcase] || code.upcase
end

def rom(code)
	roms = {
		"0" =>	"32 KiB",
		"1" =>	"64 KiB",
		"2" =>	"128 KiB",
		"3" =>	"256 KiB",
		"4" =>	"512 KiB",
		"5" =>	"1 MiB",
		"6" =>	"2 MiB",
		"7" =>	"4 MiB",
		"8" =>	"8 MiB",
		"52" =>	"1.1 MiB",
		"53" =>	"1.2 MiB",
		"54" =>	"1.5 MiB"
	}
	roms[code.upcase] || "Unknown: 0x#{code.upcase}"
end

def ram(code)
	rams = {
		"0" =>	"0",
		"1" =>	"-",
		"2" =>	"8 KiB",
		"3" =>	"32 KiB",
		"4" =>	"128 KiB",
		"5" =>	"64 KiB"
	}
	rams[code.upcase] || "Unknown: 0x#{code.upcase}"
end

# turn a string with weird escape stuff like "\x00" into "00"
def clean_string(str)
	str.ord.to_s(16).upcase
end

def parse_rom(path)
	# puts(path)
	Zip::File.open(path) do |zip_file|
		entry = zip_file.glob('*.gb*').first

		if entry
			fname = entry.name.split('.gb')[0]
			header = entry.get_input_stream.read(336)
			if header[0x0134..0x013E].nil?
				puts "Couldn't find header (BIOS?): #{entry.name}"
				return
			end
			fname.slice! '(SGB Enhanced)'
			fname.slice! '(GB Compatible)'
			title = header[0x0134..0x013E].gsub(/[^[:print:]]/,'')
			manufacturer_code = header[0x013F..0x0142].gsub(/[^[:print:]]/,'')
			case header[0x0143].ord
			when 0xC0
				cgb = 'required'
			when 0x80
				cgb = 'enhanced'
			else
				cgb = false
			end

			sgb = header[0x0146].ord == 0x03
			cartridge_type = mapper(clean_string(header[0x0147]))
			rom_size = rom(clean_string(header[0x0148]))
			ram_size = ram(clean_string(header[0x0149]))
			dest_code = header[0x014A].ord == 0x00 ? 'Japan' : 'World'

			licensee = header[0x014B]

			if licensee.ord == 0x33
				licensee = new_licensee(clean_string(header[0x0144..0x0145]))
			else
				licensee = old_licensee(clean_string(licensee))
				title += header[0x013F..0x0143].gsub(/[^[:print:]]/,'')
				manufacturer_code = ''
			end

			{
				name: fname.strip,
				title: title.strip,
				licensee: licensee.gsub(/[^[:print:]]/,''),
				destination: dest_code,
				mapper: cartridge_type.gsub(/[^[:print:]]/,''),
				rom: rom_size.gsub(/[^[:print:]]/,''),
				ram: ram_size.gsub(/[^[:print:]]/,''),
				sgb: sgb,
				cgb: cgb,
				manufacturer_code: manufacturer_code,
				header: header[0x0100..0x014F].bytes.map {|i| i.to_s(16)}.join.upcase
			}
		else
			puts "No .gb file found in the ZIP: #{path}"
		end
	end
end

# recursion like I'm in college
def parse_directory(path, roms)
	Dir.glob("#{path}/**/*") do |entry|
	  if File.file?(entry)
	    roms.append parse_rom(entry) if entry.include?('.zip')
	  elsif File.directory?(entry)
	    puts "Directory: #{entry}"
	    roms = parse_directory(entry, roms)
	  end
	end
	return roms
end

if ARGV.empty?
	puts "Usage: #{$PROGRAM_NAME} path_to_zip_file"
	exit
end

path = ARGV[0]
roms = parse_directory(path, [])

roms = roms.reject(&:nil?)
roms = roms.uniq {|e| e[:header]}

formatted_json = JSON.pretty_generate(roms)

file_path = 'games.json'

File.open(file_path, 'w') do |file|
  file.write(formatted_json)
end



