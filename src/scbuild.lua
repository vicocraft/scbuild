-- Originally developed by Orwell
-- Maintained by vico
-- Check the README
-- version 0.2 - 3 june 2012

local tArgs = { ... }
if #tArgs ~= 1 then
  print("Usage: scbuild <gunzipped schematic file>")
  return
end

local filename = tArgs[1]

if not fs.exists(filename) then
  print("File does not exist.")
  return
end

local length = 0
local height = 0
local width = 0
local blocks = {}
local data = {}

block_id = {}

-- Blocks
block_id[0] = "Air"
block_id[1] = "Stone"
block_id[2] = "Grass Block"
block_id[3] = "Dirt"
block_id[4] = "Cobblestone"
block_id[5] = "Wood Planks"
block_id[6] = "Sapling"
block_id[7] = "Bedrock"
block_id[8] = "Water"
block_id[9] = "Stationary Water"
block_id[10] = "Lava"
block_id[11] = "Stationary Lava"
block_id[12] = "Sand"
block_id[13] = "Gravel"
block_id[14] = "Gold Ore"
block_id[15] = "Iron Ore"
block_id[16] = "Coal Ore"
block_id[17] = "Wood"
block_id[18] = "Leaves"
block_id[19] = "Sponge"
block_id[20] = "Glass"
block_id[21] = "Lapis Lazuli Ore"
block_id[22] = "Lapis Lazuli Block"
block_id[23] = "Dispenser"
block_id[24] = "Sandstone"
block_id[25] = "Note Block"
block_id[26] = "Bed"
block_id[27] = "Powered Rail"
block_id[28] = "Detector Rail"
block_id[29] = "Sticky Piston"
block_id[30] = "Cobweb"
block_id[31] = "Grass"
block_id[32] = "Dead Bush"
block_id[33] = "Piston"
block_id[34] = "Piston Head"
block_id[35] = "Wool"
block_id[36] = "Block moved by Piston"
block_id[37] = "Dandelion"
block_id[38] = "Poppy"
block_id[39] = "Brown Mushroom"
block_id[40] = "Red Mushroom"
block_id[41] = "Block of Gold"
block_id[42] = "Block of Iron"
block_id[43] = "Double Stone Slab"
block_id[44] = "Stone Slab"
block_id[45] = "Bricks"
block_id[46] = "TNT"
block_id[47] = "Bookshelf"
block_id[48] = "Moss Stone"
block_id[49] = "Obsidian"
block_id[50] = "Torch"
block_id[51] = "Fire"
block_id[52] = "Monster Spawner"
block_id[53] = "Oak Wood Stairs"
block_id[54] = "Chest"
block_id[55] = "Redstone Wire"
block_id[56] = "Diamond Ore"
block_id[57] = "Block of Diamond"
block_id[58] = "Crafting Table"
block_id[59] = "Wheat"
block_id[60] = "Farmland"
block_id[61] = "Furnace"
block_id[62] = "Burning Furnace"
block_id[63] = "Standing Sign"
block_id[64] = "Oak Door"
block_id[65] = "Ladder"
block_id[66] = "Rail"
block_id[67] = "Cobblestone Stairs"
block_id[68] = "Wall Sign"
block_id[69] = "Lever"
block_id[70] = "Stone Pressure Plate"
block_id[71] = "Iron Door"
block_id[72] = "Wooden Pressure Plate"
block_id[73] = "Redstone Ore"
block_id[74] = "Glowing Redstone Ore"
block_id[75] = "Redstone Torch (inactive)"
block_id[76] = "Redstone Torch (active)"
block_id[77] = "Stone Button"
block_id[78] = "Snow (layer)"
block_id[79] = "Ice"
block_id[80] = "Snow"
block_id[81] = "Cactus"
block_id[82] = "Clay"
block_id[83] = "Sugar Cane"
block_id[84] = "Jukebox "
block_id[85] = "Fence"
block_id[86] = "Pumpkin"
block_id[87] = "Netherrack"
block_id[88] = "Soul Sand"
block_id[89] = "Glowstone"
block_id[90] = "Nether Portal"
block_id[91] = "Jack o-Lantern"
block_id[92] = "Cake"
block_id[93] = "Redstone Repeater (inactive)"
block_id[94] = "Redstone Repeater (active)"
block_id[95] = "Stained Glass"
block_id[96] = "Trapdoor"
block_id[97] = "Monster Egg "
block_id[98] = "Stone Bricks"
block_id[99] = "Brown Mushroom (block)"
block_id[100] = "Red Mushroom (block)"
block_id[101] = "Iron Bars"
block_id[102] = "Glass Pane"
block_id[103] = "Melon"
block_id[104] = "Pumpkin Stem"
block_id[105] = "Melon Stem"
block_id[106] = "Vines"
block_id[107] = "Fence Gate"
block_id[108] = "Brick Stairs"
block_id[109] = "Stone Brick Stairs"
block_id[110] = "Mycelium"
block_id[111] = "Lily Pad"
block_id[112] = "Nether Brick"
block_id[113] = "Nether Brick Fence"
block_id[114] = "Nether Brick Stairs"
block_id[115] = "Nether Wart"
block_id[116] = "Enchantment Table"
block_id[117] = "Brewing Stand "
block_id[118] = "Cauldron"
block_id[119] = "End Portal"
block_id[120] = "End Portal Frame"
block_id[121] = "End Stone"
block_id[122] = "Dragon Egg"
block_id[123] = "Redstone Lamp (inactive)"
block_id[124] = "Redstone Lamp (active)"
block_id[125] = "Double Wooden Slab"
block_id[126] = "Wooden Slab"
block_id[127] = "Cocoa"
block_id[128] = "Sandstone Stairs"
block_id[129] = "Emerald Ore"
block_id[130] = "Ender Chest"
block_id[131] = "Tripwire Hook"
block_id[132] = "Tripwire"
block_id[133] = "Block of Emerald"
block_id[134] = "Spruce Wood Stairs"
block_id[135] = "Birch Wood Stairs"
block_id[136] = "Jungle Wood Stairs"
block_id[137] = "Command Block"
block_id[138] = "Beacon"
block_id[139] = "Cobblestone Wall"
block_id[140] = "Flower Pot"
block_id[141] = "Carrot"
block_id[142] = "Potato"
block_id[143] = "Wooden Button"
block_id[144] = "Mob head"
block_id[145] = "Anvil"
block_id[146] = "Trapped Chest"
block_id[147] = "Weighted Pressure Plate (Light)"
block_id[148] = "Weighted Pressure Plate (Heavy)"
block_id[149] = "Redstone Comparator"
block_id[150] = "Redstone Comparator (deprecated)"
block_id[151] = "Daylight Sensor"
block_id[152] = "Block of Redstone"
block_id[153] = "Nether Quartz Ore"
block_id[154] = "Hopper"
block_id[155] = "Block of Quartz"
block_id[156] = "Quartz Stairs"
block_id[157] = "Activator Rail"
block_id[158] = "Dropper"
block_id[159] = "Stained Clay"
block_id[160] = "Stained Glass Pane"
block_id[161] = "Leaves (Acacia/Dark Oak)"
block_id[162] = "Wood (Acacia/Dark Oak)"
block_id[163] = "Acacia Wood Stairs"
block_id[164] = "Dark Oak Wood Stairs"
block_id[165] = "Slime Block"
block_id[166] = "Barrier"
block_id[167] = "Iron Trapdoor"
block_id[168] = "Prismarine"
block_id[169] = "Sea Lantern"
block_id[170] = "Hay Bale"
block_id[171] = "Carpet"
block_id[172] = "Hardened Clay"
block_id[173] = "Block of Coal"
block_id[174] = "Packed Ice"
block_id[175] = "Large Flowers"
block_id[176] = "Standing Banner"
block_id[177] = "Wall Banner"
block_id[178] = "Inverted Daylight Sensor"
block_id[179] = "Red Sandstone"
block_id[180] = "Red Sandstone Stairs"
block_id[181] = "Double Red Sandstone Slab"
block_id[182] = "Red Sandstone Slab"
block_id[183] = "Spruce Fence Gate"
block_id[184] = "Birch Fence Gate"
block_id[185] = "Jungle Fence Gate"
block_id[186] = "Dark Oak Fence Gate"
block_id[187] = "Acacia Fence Gate"
block_id[188] = "Spruce Fence"
block_id[189] = "Birch Fence"
block_id[190] = "Jungle Fence"
block_id[191] = "Dark Oak Fence"
block_id[192] = "Acacia Fence"
block_id[193] = "Spruce Door"
block_id[194] = "Birch Door"
block_id[195] = "Jungle Door"
block_id[196] = "Acacia Door"
block_id[197] = "Dark Oak Door"
block_id[198] = "End Rod"
block_id[199] = "Chorus Plant"
block_id[200] = "Chorus Flower"
block_id[201] = "Purpur Block"
block_id[202] = "Purpur Pillar"
block_id[203] = "Purpur Stairs"
block_id[204] = "Purpur Double Slab"
block_id[205] = "Purpur Slab"
block_id[206] = "End Stone Bricks"
block_id[207] = "Beetroot Seeds"
block_id[208] = "Grass Path"
block_id[209] = "End Gateway"
block_id[210] = "Repeating Command Block"
block_id[211] = "Chain Command Block"
block_id[212] = "Frosted Ice"
block_id[213] = "Magma Block"
block_id[214] = "Nether Wart Block"
block_id[215] = "Red Nether Brick"
block_id[216] = "Bone Block"
block_id[217] = "Structure Void"
block_id[255] = "Structure Block"

-- Items
block_id[256] = "Iron Shovel"
block_id[257] = "Iron Pickaxe"
block_id[258] = "Iron Axe"
block_id[259] = "Flint and Steel"
block_id[260] = "Apple"
block_id[261] = "Bow"
block_id[262] = "Arrow"
block_id[263] = "Coal"
block_id[264] = "Diamond"
block_id[265] = "Iron Ingot"
block_id[266] = "Gold Ingot"
block_id[267] = "Iron Sword"
block_id[268] = "Wooden Sword"
block_id[269] = "Wooden Shovel"
block_id[270] = "Wooden Pickaxe"
block_id[271] = "Wooden Axe"
block_id[272] = "Stone Sword"
block_id[273] = "Stone Shovel"
block_id[274] = "Stone Pickaxe"
block_id[275] = "Stone Axe"
block_id[276] = "Diamond Sword"
block_id[277] = "Diamond Shovel"
block_id[278] = "Diamond Pickaxe"
block_id[279] = "Diamond Axe"
block_id[280] = "Stick"
block_id[281] = "Bowl"
block_id[282] = "Mushroom Stew"
block_id[283] = "Golden Sword"
block_id[284] = "Golden Shovel"
block_id[285] = "Golden Pickaxe"
block_id[286] = "Golden Axe"
block_id[287] = "String"
block_id[288] = "Feather"
block_id[289] = "Gunpowder"
block_id[290] = "Wooden Hoe"
block_id[291] = "Stone Hoe"
block_id[292] = "Iron Hoe"
block_id[293] = "Diamond Hoe"
block_id[294] = "Golden Hoe"
block_id[295] = "Seeds"
block_id[296] = "Wheat"
block_id[297] = "Bread"
block_id[298] = "Leather Cap"
block_id[299] = "Leather Tunic"
block_id[300] = "Leather Pants"
block_id[301] = "Leather Boots"
block_id[302] = "Chain Helmet"
block_id[303] = "Chain Chestplate"
block_id[304] = "Chain Leggings"
block_id[305] = "Chain Boots"
block_id[306] = "Iron Helmet"
block_id[307] = "Iron Chestplate"
block_id[308] = "Iron Leggings"
block_id[309] = "Iron Boots"
block_id[310] = "Diamond Helmet"
block_id[311] = "Diamond Chestplate"
block_id[312] = "Diamond Leggings"
block_id[313] = "Diamond Boots"
block_id[314] = "Golden Helmet"
block_id[315] = "Golden Chestplate"
block_id[316] = "Golden Leggings"
block_id[317] = "Goldenoots"
block_id[318] = "Flint"
block_id[319] = "Raw Porkchop"
block_id[320] = "Cooked Porkchop"
block_id[321] = "Painting"
block_id[322] = "Golden Apple"
block_id[323] = "Sign"
block_id[324] = "Oak Door"
block_id[325] = "Bucket"
block_id[326] = "Water Bucket"
block_id[327] = "Lava Bucket"
block_id[328] = "Minecart"
block_id[329] = "Saddle"
block_id[330] = "Ironoor"
block_id[331] = "Redstone"
block_id[332] = "Snowball"
block_id[333] = "Boat"
block_id[334] = "Leather"
block_id[335] = "Milk"
block_id[336] = "Brick"
block_id[337] = "Clay"
block_id[338] = "Sugar Cane"
block_id[339] = "Paper"
block_id[340] = "Book"
block_id[341] = "Slimeball"
block_id[342] = "Minecart with Chest"
block_id[343] = "Minecart with Furnace"
block_id[344] = "Egg"
block_id[345] = "Compass"
block_id[346] = "Fishing Rod"
block_id[347] = "Clock"
block_id[348] = "Glowstone Dust"
block_id[349] = "Raw Fish"
block_id[350] = "Cooked Fish"
block_id[351] = "Dye"
block_id[352] = "Bone"
block_id[353] = "Sugar"
block_id[354] = "Cake"
block_id[355] = "Bed"
block_id[356] = "Redstone Repeater"
block_id[357] = "Cookie"
block_id[358] = "Map"
block_id[359] = "Shears"
block_id[360] = "Melon"
block_id[361] = "Pumpkin Seeds"
block_id[362] = "Melon Seeds"
block_id[363] = "Raw Beef"
block_id[364] = "Steak"
block_id[365] = "Raw Chicken"
block_id[366] = "Cooked Chicken"
block_id[367] = "Rotten Flesh"
block_id[368] = "Ender Pearl"
block_id[369] = "Blaze Rod"
block_id[370] = "Ghast Tear"
block_id[371] = "Gold Nugget"
block_id[372] = "Nether Wart"
block_id[373] = "Potion"
block_id[374] = "Glass Bottle"
block_id[375] = "Spider Eye"
block_id[376] = "Fermented Spider Eye"
block_id[377] = "Blaze Powder"
block_id[378] = "Magma Cream"
block_id[379] = "Brewing Stand"
block_id[380] = "Cauldron"
block_id[381] = "Eye of Ender"
block_id[382] = "Glistering Melon"
block_id[383] = "Spawn Egg"
block_id[384] = "Bottle o' Enchanting"
block_id[385] = "Fire Charge"
block_id[386] = "Book and Quill"
block_id[387] = "Written Book"
block_id[388] = "Emerald"
block_id[389] = "Item Frame"
block_id[390] = "Flower Pot"
block_id[391] = "Carrot"
block_id[392] = "Potato"
block_id[393] = "Baked Potato"
block_id[394] = "Poisonous Potato"
block_id[395] = "Empty Map"
block_id[396] = "Golden Carrot"
block_id[397] = "Mob head"
block_id[398] = "Carrot on a Stick"
block_id[399] = "Nether Star"
block_id[400] = "Pumpkin Pie"
block_id[401] = "Firework Rocket"
block_id[402] = "Firework Star"
block_id[403] = "Enchanted Book"
block_id[404] = "Redstone Comparator"
block_id[405] = "Netherrick"
block_id[406] = "Nether Quartz"
block_id[407] = "Minecart with TNT"
block_id[408] = "Minecart with Hopper"
block_id[409] = "Prismarine Shard"
block_id[410] = "Prismarine Crystals"
block_id[411] = "Raw Rabbit"
block_id[412] = "Cooked Rabbit"
block_id[413] = "Rabbit Stew"
block_id[414] = "Rabbit's Foot"
block_id[415] = "Rabbit Hide"
block_id[416] = "Armor Stand"
block_id[417] = "Iron Horse Armor"
block_id[418] = "Golden Horse Armor"
block_id[419] = "Diamond Horse Armor"
block_id[420] = "Lead"
block_id[421] = "Name Tag"
block_id[422] = "Minecart with Commandlock"
block_id[423] = "Raw Mutton"
block_id[424] = "Cooked Mutton"
block_id[425] = "Banner"
block_id[426] = "End Crystal"
block_id[427] = "Spruce Door"
block_id[428] = "Birch Door"
block_id[429] = "Jungle Door"
block_id[430] = "Acacia Door"
block_id[431] = "Dark Oakoor"
block_id[432] = "Chorus Fruit"
block_id[433] = "Popped Chorus Fruit"
block_id[434] = "Beetroot"
block_id[435] = "Beetroot Seeds"
block_id[436] = "Beetroot Soup"
block_id[437] = "Dragon's Breath"
block_id[438] = "Splash Potion"
block_id[439] = "Spectral Arrow"
block_id[440] = "Tipped Arrow"
block_id[441] = "Lingering Potion"
block_id[442] = "Shield"
block_id[443] = "Elytra"
block_id[444] = "Spruce Boat"
block_id[445] = "Birch Boat"
block_id[446] = "Jungle Boat"
block_id[447] = "Acacia Boat"
block_id[448] = "Dark Oak Boat"
block_id[2256] = "13 Disc"
block_id[2257] = "Cat Disc"
block_id[2258] = "Blocks Disc"
block_id[2259] = "Chirp Disc"
block_id[2260] = "Far Disc"
block_id[2261] = "Mall Disc"
block_id[2262] = "Mellohi Disc"
block_id[2263] = "Stal Disc"
block_id[2264] = "Strad Disc"
block_id[2265] = "Ward Disc"
block_id[2266] = "11 Disc"
block_id[2267] = "Wait Disc"

woolColors = {}
woolColors[0] = "White"
woolColors[1] = "Orange"
woolColors[2] = "Magenta"
woolColors[3] = "Light Blue"
woolColors[4] = "Yellow"
woolColors[5] = "Lime"
woolColors[6] = "Pink"
woolColors[7] = "Gray"
woolColors[8] = "Light Gray"
woolColors[9] = "Cyan"
woolColors[10] = "Purple"
woolColors[11] = "Blue"
woolColors[12] = "Brown"
woolColors[13] = "Green"
woolColors[14] = "Red"
woolColors[15] = "Black"

woodColors = {}
woodColors[0] = "Oak"
woodColors[1] = "Spruce"
woodColors[2] = "Birch"
woodColors[3] = "Jungle"
woodColors[4] = "Acacia"
woodColors[5] = "Dark Oak"

sandstoneType = {}
sandstoneType[0] = "Normal"
sandstoneType[1] = "Chiseled"
sandstoneType[2] = "Smooth"

function getBlockName(id, blockData)
  blockData = blockData or nil
  if(block_id[id] == nil) then
    return "UNKNOWN"
  else
    if(blockData) then
	  -- Wood
      if(id == 5) then
        str = woodColors[blockData] .. " " .. block_id[id]
        return str
      end
	  -- Wool e Carpet
      if (id == 35 or id == 171) then
        str = woolColors[blockData] .. " " .. block_id[id]
        return str
      end
	  -- (Red) Sandstone
      if (id == 24 or id == 179) then
        str = sandstoneType[blockData] .. " " .. block_id[id]
        return str
      end
    end
    return block_id[id]
  end
end

function getBlockId(x,y,z)
  return blocks[y + z*width + x*length*width + 1]
end

function getData(x,y,z)
  return data[y + z*width + x*length*width + 1]
end

function readbytes(h, n)
  for i=1,n do
    h.read()
  end
end

function readname(h)  
  n1 = h.read()
  n2 = h.read()

  if(n1 == nil or n2 == nil) then
    return ""
  end
  
  n = n1*256 + n2
  
  str = ""
  for i=1,n do
    c = h.read()
    if c == nil then
      return
    end  
    str = str .. string.char(c)
  end
  return str
end

function parse(a, h, containsName)
  containsName = containsName or true
  if a==0 then
    return
  end
  if containsName then
    name = readname(h)
  end
    
  if a==1 then
    readbytes(h,1)  
  elseif a==2 then
    i1 = h.read()
    i2 = h.read()
    i = i1*256 + i2
    if(name=="Height") then
      height = i
    elseif (name=="Length") then
      length = i
    elseif (name=="Width") then
      width = i
    end
  elseif a==3 then
    readbytes(h,4)
  elseif a==4 then
    readbytes(h,8)
  elseif a==5 then
    readbytes(h,4)
  elseif a==6 then
    readbytes(h,8)
  elseif a==7 then
    i1 = h.read()
    i2 = h.read()
    i3 = h.read()
    i4 = h.read()
    i = i1*256*256*256 + i2*256*256 + i3*256 + i4
    if name == "Blocks" then
      for i=1,i do
        table.insert(blocks, h.read())
      end
    elseif name == "Data" then
      for i=1,i do
        table.insert(data, h.read())
      end
    else
      readbytes(h,i)
    end
  elseif a==8 then
    i1 = h.read()
    i2 = h.read()
    i = i1*256 + i2
    readbytes(h,i)
  elseif a==9 then
  	--readbytes(h,5)
  	type = h.read()
  	i1 = h.read()
    i2 = h.read()
    i3 = h.read()
    i4 = h.read()
    i = i1*256*256*256 + i2*256*256 + i3*256 + i4
    for j=1,i do
      parse(h.read(), h, false)
    end
  end
end

function forward()
  while not turtle.forward() do
    turtle.dig()
  end
end

function up()
  while not turtle.up() do
    turtle.digUp()
  end
end

function down()
  while not turtle.down() do
    turtle.digDown()
  end
end

function place()
  iteminfo = turtle.getItemDetail()
  if iteminfo then
    if iteminfo.name ~= "minecraft:wheat_seeds" then
      while not turtle.placeDown() do
        turtle.digDown()
      end
      turtle.placeDown()
    end
  end
end

h = fs.open(filename, "rb")

a = 0
while (a ~= nil) do
  a = h.read()
  parse(a, h)
end

write("length: " .. length)
write("   width: " .. width)
write("   height: " .. height .. "\n")

uniqueblocks={}
for i,v in ipairs(blocks) do
  found = false
  for j,w in ipairs(uniqueblocks) do
    -- for now, data is only accounted for when the block is whool
    if (w.blockID==v and (w.data==data[i] or w.blockID ~= 35)) then
      found = true
      w.amount = w.amount + 1
      break
    end
  end
  
  if found==false then
    uniqueblocks[#uniqueblocks+1] = {}
    uniqueblocks[#uniqueblocks].blockID = v
    uniqueblocks[#uniqueblocks].data = data[i]
    uniqueblocks[#uniqueblocks].amount = 1
  end
end

print("number of block types: " .. #uniqueblocks)
for i,v in ipairs(uniqueblocks) do
  if (i%9)==0 then
    read()
  end
  print(" -" .. getBlockName(v.blockID, v.data) .. ": " .. v.amount)
end

read()

print("Give the numbers of all slots containing the specified block type:")

slots={}
for i,block in ipairs(uniqueblocks) do
  blockData = block.data
  print(" -in which slots is " .. getBlockName(block.blockID, blockData) .. "?")
  if not slots[block.blockID] then
    slots[block.blockID] = {}
  end
  slots[block.blockID][blockData] = {}
  write("   ")
  str = read()
  for i = 1, #str do
    local c = str:sub(i,i)
    n = tonumber(c)
    if(n) then
      if(n>0 and n<10) then
        table.insert(slots[block.blockID][blockData], n)
      end
    end
  end
end

print("Press key to start building...")
read()

up()
n = 1
turtle.select(n)

for x=1,height do
  for y=1,width do
    for z=1,length do
      blockID = getBlockId(x-1,y-1,z-1)
      blockData = getData(x-1,y-1,z-1)
      forward()
      turtle.digDown()
      slot_lst = slots[blockID][blockData]
      if(slot_lst ~= nil) then
        if(#slot_lst > 0) then
          local found=false
          for i,v in ipairs(slot_lst) do
            if(turtle.getItemCount(v) > 0) then
              found=true
              turtle.select(v)
              break
            end
          end
          if not found then
            print("Not enough " .. getBlockName(blockID, blockData) .. ". Please refill...")
            read()
          end
          place()
        end
      end
    end
    turtle.turnLeft()
    forward()
    turtle.turnLeft()
    for i=1,length do
      forward()
    end
    turtle.turnRight()
    turtle.turnRight()
  end
  turtle.turnRight()
  for i=1,width do
    forward()
  end
  turtle.turnLeft()
  up()
end

for i=1,height+1 do
  down()
end