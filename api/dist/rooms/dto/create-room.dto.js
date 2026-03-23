"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CreateRoomDto = void 0;
const class_validator_1 = require("class-validator");
const room_mode_enum_1 = require("../enums/room-mode.enum");
const room_difficulty_enum_1 = require("../enums/room-difficulty.enum");
const ALLOWED_LANGUAGES = ['javascript', 'python'];
class CreateRoomDto {
    name;
    mode;
    rounds;
    roundTime;
    difficulty;
    languages;
    maxPlayers;
    public;
}
exports.CreateRoomDto = CreateRoomDto;
__decorate([
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateRoomDto.prototype, "name", void 0);
__decorate([
    (0, class_validator_1.IsEnum)(room_mode_enum_1.RoomMode),
    __metadata("design:type", String)
], CreateRoomDto.prototype, "mode", void 0);
__decorate([
    (0, class_validator_1.IsInt)(),
    (0, class_validator_1.Min)(1),
    (0, class_validator_1.Max)(10),
    __metadata("design:type", Number)
], CreateRoomDto.prototype, "rounds", void 0);
__decorate([
    (0, class_validator_1.IsIn)([5, 10, 15, 20, 25, 30]),
    __metadata("design:type", Number)
], CreateRoomDto.prototype, "roundTime", void 0);
__decorate([
    (0, class_validator_1.IsEnum)(room_difficulty_enum_1.RoomDifficulty),
    __metadata("design:type", String)
], CreateRoomDto.prototype, "difficulty", void 0);
__decorate([
    (0, class_validator_1.IsArray)(),
    (0, class_validator_1.ArrayMinSize)(1),
    (0, class_validator_1.IsIn)(ALLOWED_LANGUAGES, { each: true }),
    __metadata("design:type", Array)
], CreateRoomDto.prototype, "languages", void 0);
__decorate([
    (0, class_validator_1.ValidateIf)((o) => o.mode === room_mode_enum_1.RoomMode.FFA),
    (0, class_validator_1.IsInt)(),
    (0, class_validator_1.Min)(2),
    (0, class_validator_1.Max)(8),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Number)
], CreateRoomDto.prototype, "maxPlayers", void 0);
__decorate([
    (0, class_validator_1.IsBoolean)(),
    __metadata("design:type", Boolean)
], CreateRoomDto.prototype, "public", void 0);
//# sourceMappingURL=create-room.dto.js.map