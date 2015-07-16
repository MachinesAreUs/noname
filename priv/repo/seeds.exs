items = [
  %{
    title:         "El gobierno de EU puede ver fotos de desnudos, segun Edward Snowden", 
    provider:      "CNNMoney", 
    body:          "John Oliver, comediante de la cadena de television HBO, dio su mejor golpe hasta el momento: una entrevista a profundidad con Edward Snowden, excontratista de la Agencia Nacional de Seguridad (NSA, por sus siglas en ingles) de Estados Unidos.",
    creation_date: %Ecto.DateTime{day: 8, month: 4, year: 2015, hour: 0, min: 0, sec: 0}, 
  },
  %{
    title:          "Estado Mayor vigilo la \“casa blanca\” hasta enero pasado", 
    provider:       "CNNMoney", 
    body:           "El Estado Mayor Presidencial (EMP) resguardo la \“casa blanca\” de las Lomas de Chapultepec hasta el pasado mes de enero, es decir, poco más de dos meses después de que la primera dama, Angélica Rivera, aseguró que vendería esa propiedad.",
    creation_date:  %Ecto.DateTime{day: 8, month: 4, year: 2015, hour: 0, min: 0, sec: 0}, 
    embargo:        %Ecto.DateTime{day: 8, month: 4, year: 2015, hour: 0, min: 0, sec: 0} 
  }
]

for item <- items do
  new_item = Map.merge(%Iris.NewsItem{}, item)
  Iris.Repo.insert(new_item)
end