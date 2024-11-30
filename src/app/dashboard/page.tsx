<div className="space-y-6">
  <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
    {/* Cartes de statistiques */}
  </div>

  <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
    <Card>
      <Title>Répartition des appels d'urgence</Title>
      <BarChart
        className="mt-4 h-[300px]"
        data={chartdata}
        index="name"
        categories={["Appels"]}
        colors={["blue"]}
        layout="vertical"
        stack={false}
      />
    </Card>

    <Card>
      <Title>Tendances mensuelles</Title>
      <LineChart
        className="mt-4 h-[300px]"
        data={monthlyData}
        index="date"
        categories={["Appels", "Alertes"]}
        colors={["blue", "red"]}
      />
    </Card>
  </div>
</div> 