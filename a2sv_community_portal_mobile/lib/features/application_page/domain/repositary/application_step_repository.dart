import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/entities/application_step_entity.dart';
import 'package:dartz/dartz.dart';


abstract class ApplicationStepRepo {
  Future<Either<Failure, List<ApplicationStepEntity>>> getApplicationStepFromDataSource();
  
}