import { CreateRoomDto } from './dto/create-room.dto';
import { RoomsService } from './rooms.service';
export declare class RoomsController {
    private readonly roomsService;
    constructor(roomsService: RoomsService);
    create(dto: CreateRoomDto): {
        roomId: string;
    };
}
