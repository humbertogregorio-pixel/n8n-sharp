const fs = require('fs');
const sharp = require('sharp');

async function main() {
  const [
    inputPath,
    overlayPath,
    outputPath,
    widthArg,
    heightArg
  ] = process.argv.slice(2);

  if (!inputPath || !overlayPath || !outputPath) {
    throw new Error('Usage: node render.js <input> <overlay> <output> [width] [height]');
  }

  const width = Number(widthArg || 1200);
  const height = Number(heightArg || 628);

  await sharp(inputPath)
    .resize(width, height, {
      fit: 'cover',
      position: 'centre',
    })
    .composite([
      {
        input: overlayPath,
        gravity: 'center',
      },
    ])
    .jpeg({
      quality: 90,
      mozjpeg: true,
    })
    .toFile(outputPath);

  const stats = fs.statSync(outputPath);

  console.log(JSON.stringify({
    success: true,
    outputPath,
    size: stats.size,
    width,
    height,
  }));
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});