physio = tapas_physio_new();

%physio_path='/u/project/elondon/data/mri/sexdiffs_smoking/11053_1/physio/'
%physio_path='/Users/dghahremani/hoff2/mri/sexdiffs_smoking/11053_1/physio/'

physio.log_files.vendor = 'Siemens_Tics';
%physio.log_files.cardiac = fullfile(physio_path,'Physio_20180913_092406_580c007b-2513-44e2-b0e3-073272ff6917_PULS.log');
%physio.log_files.respiration = fullfile(physio_path,'Physio_20180913_092406_580c007b-2513-44e2-b0e3-073272ff6917_RESP.log');
%physio.log_files.scan_timing = fullfile(physio_path,'Physio_20180913_092406_580c007b-2513-44e2-b0e3-073272ff6917_Info.log');
physio.log_files.cardiac = ('Physio_20180913_092406_580c007b-2513-44e2-b0e3-073272ff6917_PULS.log');
physio.log_files.respiration = ('Physio_20180913_092406_580c007b-2513-44e2-b0e3-073272ff6917_RESP.log');
physio.log_files.scan_timing = ('Physio_20180913_092406_580c007b-2513-44e2-b0e3-073272ff6917_Info.log');
physio.log_files.relative_start_acquisition = 0;
physio.log_files.align_scan = 'last';
physio.scan_timing.sqpar.Nslices = 64/4; % nSlices/multibandFactor
physio.scan_timing.sqpar.TR = 1.462;
physio.scan_timing.sqpar.Ndummies = 0;
physio.scan_timing.sqpar.Nscans = 288; % note that the 1st few scans may have different number of volumes (scans)
physio.scan_timing.sqpar.onset_slice = 1;
physio.scan_timing.sync.method = 'scan_timing_log';
%physio.scan_timing.sync.method = '/u/project/elondon/data/mri/sexdiffs_smoking/11008_1/dicom/11008_1/Prisma_fit_MRC35426/20171215/London^SexDiffs_Smoking_1/BOLD_SmokeCues_MultiTE_12/000001.dcm';  %scan_timing_log
physio.preproc.cardiac.modality = 'PPU';
physio.preproc.cardiac.initial_cpulse_select.method = 'auto_matched';
physio.preproc.cardiac.initial_cpulse_select.file = 'initial_cpulse_kRpeakfile.mat';
physio.preproc.cardiac.initial_cpulse_select.min = 0.4;
physio.preproc.cardiac.posthoc_cpulse_select.method = 'off';
physio.preproc.cardiac.posthoc_cpulse_select.percentile = 80;
physio.preproc.cardiac.posthoc_cpulse_select.upper_thresh = 60;
physio.preproc.cardiac.posthoc_cpulse_select.lower_thresh = 60;
physio.model.orthogonalise = 'none';
physio.model.censor_unreliable_recording_intervals = false;
physio.model.output_multiple_regressors = 'multiple_regressors.txt';
physio.model.output_physio = 'physio.mat';
physio.model.retroicor.include = true;
physio.model.retroicor.order.c = 3;
physio.model.retroicor.order.r = 4;
physio.model.retroicor.order.cr = 1;
physio.model.rvt.include = false;
physio.model.rvt.delays = 0;
physio.model.hrv.include = false;
physio.model.hrv.delays = 0;
physio.model.noise_rois.include = false;
physio.model.noise_rois.thresholds = 0.9;
physio.model.noise_rois.n_voxel_crop = 0;
physio.model.noise_rois.n_components = 1;
physio.model.movement.include = false;
physio.model.movement.order = 6;
physio.model.movement.censoring_threshold = 0.5;
physio.model.movement.censoring_method = 'FD';
physio.model.other.include = false;
physio.verbose.level = 2;
physio.verbose.process_log = cell(0, 1);
physio.verbose.fig_handles = zeros(0, 1);
physio.verbose.use_tabs = false;
physio.ons_secs.c_scaling = 1;
physio.ons_secs.r_scaling = 1;

physio = tapas_physio_main_create_regressors(physio);
