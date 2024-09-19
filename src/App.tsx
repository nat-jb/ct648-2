import { useEffect, useState } from 'react';
import './App.css';

interface CoinPrice {
  id: string;
  price: number;
  prevPrice?: number;
}

const App: React.FC = () => {
  const [prices, setPrices] = useState<CoinPrice[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  const fetchPrices = async () => {
    try {
      const response = await fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,litecoin&vs_currencies=usd');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json();

      const pricesArray = Object.keys(data).map(key => {
        const currentPrice = data[key].usd;
        const existingCoin = prices.find(coin => coin.id === key);

        return {
          id: key,
          price: currentPrice,
          prevPrice: existingCoin ? existingCoin.price : undefined,
        };
      });

      setPrices(pricesArray);
      setLoading(false);
    } catch (err: any) {
      setError(err.message);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPrices();
    const intervalId = setInterval(fetchPrices, 20000);
    return () => clearInterval(intervalId);
  }, []);

  return (
    <div className="app-container">
      <h1 className="title">Cryptocurrency Price Tracker</h1>
      {loading ? (
        <p className="status">Loading...</p>
      ) : error ? (
        <p className="error">Error: {error}</p>
      ) : (
        <div className="price-container">
          {prices.map(coin => {
            const priceChange = coin.prevPrice !== undefined ? coin.price - coin.prevPrice : 0;
            const priceClass = priceChange > 0 ? 'increase' : priceChange < 0 ? 'decrease' : '';

            return (
              <p key={coin.id} className={`price ${priceClass}`}>
                The current price of {coin.id.charAt(0).toUpperCase() + coin.id.slice(1)} is <span className="price-value">${coin.price} USD</span>.
              </p>
            );
          })}
        </div>
      )}
    </div>
  );
}

export default App;
