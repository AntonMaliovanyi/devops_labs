import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    fetch('http://localhost:5000/api')
      .then(response => response.json())
      .then(data => setMessage(data.message));
  }, []);

  return (
    <div>
      <h1>Frontend with React & Vite</h1>
      <p>{message}</p>
    </div>
  );
}

export default App;
