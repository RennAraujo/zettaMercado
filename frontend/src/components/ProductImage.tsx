import React, { useState, useEffect } from 'react';
import { Box, Skeleton } from '@mui/material';

// Placeholder SVG base64 - nunca quebra
const PLACEHOLDER_IMAGE = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAwIiBoZWlnaHQ9IjQwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iNDAwIiBoZWlnaHQ9IjQwMCIgZmlsbD0iI2Y1ZjVmNSIvPjx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTgiIGZpbGw9IiM5OTkiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGR5PSIuM2VtIj7wn5OIIEltYWdlbSBuw6RvIGRpc3BvbmnDrmF2ZWw8L3RleHQ+PC9zdmc+';

interface ProductImageProps {
  src?: string;
  alt: string;
  height?: number | string;
}

const ProductImage: React.FC<ProductImageProps> = ({ src, alt, height = 200 }) => {
  const [imageSrc, setImageSrc] = useState<string>(PLACEHOLDER_IMAGE);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  useEffect(() => {
    if (!src || src.trim() === '') {
      setImageSrc(PLACEHOLDER_IMAGE);
      setLoading(false);
      return;
    }

    // Verifica se é uma URL válida
    const img = new Image();
    
    img.onload = () => {
      setImageSrc(src);
      setLoading(false);
      setError(false);
    };
    
    img.onerror = () => {
      setImageSrc(PLACEHOLDER_IMAGE);
      setLoading(false);
      setError(true);
    };

    // Timeout de 5 segundos
    const timeout = setTimeout(() => {
      if (loading) {
        setImageSrc(PLACEHOLDER_IMAGE);
        setLoading(false);
        setError(true);
      }
    }, 5000);

    img.src = src;

    return () => clearTimeout(timeout);
  }, [src]);

  return (
    <Box sx={{ position: 'relative', height, backgroundColor: '#f5f5f5' }}>
      {loading && (
        <Skeleton 
          variant="rectangular" 
          width="100%" 
          height={height}
          animation="wave"
          sx={{ position: 'absolute', top: 0, left: 0 }}
        />
      )}
      <Box
        component="img"
        src={imageSrc}
        alt={alt}
        sx={{
          width: '100%',
          height: '100%',
          objectFit: 'cover',
          opacity: loading ? 0 : 1,
          transition: 'opacity 0.3s ease',
        }}
      />
    </Box>
  );
};

export default ProductImage;