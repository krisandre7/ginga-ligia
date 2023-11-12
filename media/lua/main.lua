local contador = 0

function handler(evt) 
  print('Evento gerado: '..evt.type)
  if (evt.class == 'ncl') and (evt.type == 'attribution') and (evt.action == 'start') then
    contador = contador + evt.value
     
  end
end

event.register(handler)