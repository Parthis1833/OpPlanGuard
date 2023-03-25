package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.request.EventDto;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.repositories.EventRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class EventService{
    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private ModelMapper modelMapper;

    public List<EventDto> getAllEvents() {
        List<Event> events = (List<Event>) eventRepository.findAll();
        return events.stream().map(e -> modelMapper.map(e, EventDto.class)).toList();
    }

    public EventDto saveEvent(EventDto dto) {
        Event event = modelMapper.map(dto, Event.class);
        Event savedEvent = eventRepository.save(event);
        return modelMapper.map(savedEvent, EventDto.class);
    }

    public EventDto updateEvent(EventDto dto, Long eventId) {
        if (Objects.isNull(eventId)){
            throw new DataNotFoundException("Event id not found with id " + eventId);
        }
        Optional<Event> optionalEvent = eventRepository.findById(eventId);
        if (optionalEvent.isEmpty()) {
            throw new DataNotFoundException("Event not found with id " + eventId);
        } else {
            Event obtainedEvent = optionalEvent.get();
            obtainedEvent.setEventName(dto.getEventName());
            obtainedEvent.setEventDetails(dto.getEventDetails());
            obtainedEvent.setEventStartDate(dto.getEventStartDate());
            obtainedEvent.setEventEndDate(dto.getEventEndDate());
//            obtainedEvent.setAssignPolice(dto.getAssignPolice());
            Event savedEvent = eventRepository.save(obtainedEvent);
            return modelMapper.map(savedEvent, EventDto.class);

        }
    }

    public Event readSpecific(Long eventId){
        return eventRepository.findById(eventId)
                .orElseThrow(()->new DataNotFoundException("Event not found with id: " + eventId));
    }

    public void deleteEvent(Long eventId){
        eventRepository.deleteById(eventId);
    }

    public List<Event> getEventsBetweenGivenEvent(long eventId) {
        Event event = eventRepository.findById(eventId).
                orElseThrow(()->new DataNotFoundException("Event not found with id: " + eventId));
        return eventRepository.getEventsBetweenGivenEvent(event.getEventStartDate(), event.getEventEndDate());
    }
}
