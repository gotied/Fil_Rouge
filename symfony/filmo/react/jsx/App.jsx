import React from "react";
import { Link, Route, Routes } from "react-router-dom";
import Genre from "/react/jsx/Genre";
import Produit from "/react/jsx/Produit";
import DetailsProduit from "/react/jsx/DetailsProduit";

function App() {

  return (
      <Routes>
        <Route path="Genre/*" element={<Genre />} />
        <Route path="Produit/:id/*" element={<Produit />} />
        <Route path="DetailsProduit/:id/*" element={<DetailsProduit />} />
      </Routes>
  );
}

export default App;